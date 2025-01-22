//
//  ProfileController.swift
//  ZooApp
//
//  Created by Narmin Alasova on 21.01.25.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageIcon()
        
        fullNameField.text = UserDefaults.standard.string(forKey: "fullName")
        emailField.text = UserDefaults.standard.string(forKey: "email")
    }
    
    func configureImageIcon() {
        imageIcon.layer.cornerRadius = 18
        imageIcon.layer.masksToBounds = true
        imageIcon.layer.borderColor = UIColor.white.cgColor
        imageIcon.layer.borderWidth = 2
        imageIcon.contentMode = .scaleAspectFill
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
    }
}
