//
//  LoginController.swift
//  ZooApp
//
//  Created by Narmin Alasova on 04.01.25.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Login Page"
        
        configureImageIcon()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailField.text,
            let password = passwordField.text {
            
            viewModel.getData()
            let checkAuth = viewModel.checkAuth(email: email, password: password)

            if !checkAuth {
                showInvalidAlert()
                return
            }
            
            viewModel.setUserDefaults(email: email)
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            
            guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
            
            sceneDelegate.homeRoot()
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let registerController = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        
        registerController.registerAction = { user in
            self.emailField.text = user.email
            self.passwordField.text = user.password
        }

        navigationController?.show(registerController, sender: nil)
    }
    
    func showInvalidAlert() {
        let alertController = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func configureImageIcon() {
//        imageIcon.layer.cornerRadius = 30
        imageIcon.layer.masksToBounds = true
        imageIcon.layer.borderColor = UIColor.white.cgColor
        imageIcon.layer.borderWidth = 2
        imageIcon.contentMode = .scaleAspectFill
    }
    
}
