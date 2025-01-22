//
//  RegisterController.swift
//  ZooApp
//
//  Created by Narmin Alasova on 21.01.25.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var registerAction: ((User) -> Void)?
    var viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Register Page"
        
        configureImageIcon()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let fullName = fullNameField.text , !fullName.isEmpty,
            let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty
        {
            var user = User(id: nil, fullName: fullName, email: email, password: password)
            
            viewModel.getData()
            
            user.id = viewModel.getLastUserId() + 1
           
            viewModel.saveUserData(user: user)
            
            registerAction?(user)
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    func configureImageIcon() {
//        imageIcon.layer.cornerRadius = 30
        imageIcon.layer.masksToBounds = true
        imageIcon.layer.borderColor = UIColor.white.cgColor
        imageIcon.layer.borderWidth = 2
        imageIcon.contentMode = .scaleAspectFill
    }
    
}
