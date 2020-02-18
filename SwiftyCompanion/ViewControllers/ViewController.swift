//
//  ViewController.swift
//  SwiftyCompanion
//
//  Created by Boris on 2/3/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Locksmith

class ViewController: UIViewController {
    
    var auth = Auth()
    var json: JSON?

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
     @IBAction func searchButtonPressed(_ sender: UIButton) {
            searchButton.isEnabled = false
            activityIndicator.startAnimating()
            auth.searchLogin(searchTextField.text!) { (json, errMsg) in
                
                self.activityIndicator.stopAnimating()
                if json != nil {
                    self.json = json
                    self.performSegue(withIdentifier: "segueToProfileVC", sender: self)
                } else {
                    let msg = errMsg ?? "Login \(self.searchTextField.text!) doesn't exist"
                    let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                self.searchButton.isEnabled = true
            }
            
        }
        
        @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
            if sender.text == " " {
                sender.text = ""
            }
            searchButton.isEnabled = sender.text == "" ? false : true
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            searchButton.isEnabled = false
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "42_bg")!)
            do {
                try Locksmith.updateData(data: ["token" : "9308708acc14ee02fc736e48515959068ddb770c6e44be93a79fdec2e2836f31"], forUserAccount: "myAccount")
            } catch {
                print("Can't save token")
            }
            auth.getToken()
            
            // remove this segue
            //self.performSegue(withIdentifier: "segueToProfileVC", sender: self)
            searchTextField.text = "bogoncha"
            self.searchButton.isEnabled = true

            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        
        // hides keyboard if user clicks on the background view
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segueToProfileVC" {
                let destination = segue.destination as! ProfileViewController
                destination.json = json
            }
        }
    }

    extension ViewController: UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            if searchButton.isEnabled {
                searchButton.sendActions(for: .touchUpInside)
            }
            return true
        }
    }

