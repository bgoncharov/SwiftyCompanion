//
//  Auth.swift
//  SwiftyCompanion
//
//  Created by Boris on 2/4/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import Locksmith

class Auth: NSObject {

    private let userAccount = "myAccount"
    private var token = String()
    private var bearer: [String: String] {
        return ["Authorization": "Bearer " + token]
    }
    private var authURL = "https://api.intra.42.fr/oauth/token"
    private var tokenInfoURL: String { return authURL + "/info"}
    
    private var parameters = [
        "grant_type": "client_credentials",
    "client_id":"90aca466e9a0f2a683c28a277e1d70ce717efc049b19358752af087b1cd0e2f0",
    "client_secret": "63509e7ff509415cae5cb43cc8e24ac2daa4892825b626394393a65201e7d902",
    "scope": "public"
    ]
    
    func checkTockInKC() {
        let userData = Locksmith.loadDataForUserAccount(userAccount: userAccount)
        if let value = userData?["token"] as? String {
            token = value
        } else {
            token = ""
        }
    }

    func getToken() {
        checkTockInKC()
        if token.isEmpty {
            Alamofire.request(authURL, method: .post, parameters: parameters).validate().responseJSON { (responseJSON) in
                switch responseJSON.result {
                case .success(let value):
                    let json = JSON(value)
                    if let value = json["access_token"].string {
                        self.token = value
                        do {
                            try Locksmith.saveData(data: ["token" : value], forUserAccount: self.userAccount)
                        } catch {
                            print("Unable to save the token")
                        }
                        print("New token just generated: ", self.token)
                    }
                    
                case .failure:
                    var errorMessage = "Received an error requesting the token"
                    var response = JSON()
                   if let data = responseJSON.data {
                        do {
                            response = try JSON(data: data)
                        } catch (let error) {
                            print(error)
                        }
                        if let message = response["error_description"].string {
                            if !message.isEmpty {
                                errorMessage = message
                            }
                        }
                    }
                    print("Error: ", errorMessage)
                }
            }
        } else {
            print("Using the same token:", token)
            checkToken()
        }
    }
    
    func checkToken() {
        Alamofire.request(tokenInfoURL, method: .get, headers: bearer).validate().responseJSON { (responseJSON) in
            switch responseJSON.result {
            case .success(let value):
                let json = JSON(value)
                print("The token will expire in: ", json["expires_in_seconds"], " seconds")
            case .failure:
                print("Token is invalid. Getting a new one.")
                do {
                    try Locksmith.deleteDataForUserAccount(userAccount: self.userAccount)
                } catch {
                    print("There is an error: ", error)
                }
                print("Wrong token was deleted from keychain")
                self.getToken()
            }
        }
    }
    
    func searchLogin(_ login: String, completionHandler: @escaping (JSON?, String?) -> Void ) {
        let loginURL = "https://api.intra.42.fr/v2/users/" + login
        print("Login URL -> ", loginURL)
        print("Token: -> ", token)
        Alamofire.request(loginURL, headers: bearer).validate().responseJSON { (responseJSON) in
            switch responseJSON.result {
            case .success(let value):
               // print("User JSON -> ", JSON(value))
                completionHandler(JSON(value), nil)
            case .failure:
                var errMsg: String?
                var response = JSON()
                if let data = responseJSON.data {
                    do {
                        response = try JSON(data: data)
                    } catch (let error) {
                        print("Error due creating JSON obj", error)
                    }
                    debugPrint(response)
                    errMsg = response["message"].string
                }
                completionHandler(nil, errMsg)
            }
        }
    }
}
