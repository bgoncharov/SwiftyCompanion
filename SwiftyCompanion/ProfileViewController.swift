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
    @IBOutlet weak var skillsTable: UITableView!
    @IBOutlet weak var projectsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar.layer.borderWidth = 2
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        backgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "42_bg")!)
        
        skillsTable.layer.cornerRadius = 5
        projectsTable.layer.cornerRadius = 5
    }
    
    func setProfileFields() {
        
    }
    
    func setPhoto() {
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == skillsTable, let cell = tableView.dequeueReusableCell(withIdentifier: "skillsCell", for: indexPath) as? SkillsTableViewCell {
            cell.skillLabel.text = "Algorithms"
            return cell
        } else if tableView == projectsTable, let cell = tableView.dequeueReusableCell(withIdentifier: "projectsCell", for: indexPath) as? ProjectsTableViewCell {
            cell.projectLabel.text = "Swifty Companion - 125.0%"
            return cell
        }
        return UITableViewCell()
    }
    
}

