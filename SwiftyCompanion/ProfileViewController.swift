//
//  ProfileViewController.swift
//  SwiftyCompanion
//
//  Created by Boris on 2/4/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProfileViewController: UIViewController {

    var json: JSON?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar.layer.borderWidth = 2
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        backgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "42_bg")!)
    }
    
    func setProfileFields() {
        
    }

    func setPhoto() {
        
    }
    
}
