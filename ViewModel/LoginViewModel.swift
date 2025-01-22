//
//  LoginViewModel.swift
//  ZooApp
//
//  Created by Narmin Alasova on 21.01.25.
//

import Foundation

class LoginViewModel {
    private var fileManagerAdapter = FileManagerHelper()
    private var users = [User]()
    
    func getData() {
        self.users = fileManagerAdapter.readUserData()
    }
    
    func saveUserData(_ user: User) {
        users.append(user)
        fileManagerAdapter.writeUserData(users: users)
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    func checkAuth(email: String, password: String) -> Bool {
        let users = getUsers()
        
        for user in users {
            if user.email == email && user.password == password {
                return true
            }
           
        }
        return false
    }
    
    func findUserByEmail(email: String) -> User? {
        let users = getUsers()
        
        for user in users {
            if user.email == email {
                return user
            }
        }
        return nil
    }
    
    func setUserDefaults(email: String) {
        let user = findUserByEmail(email: email)
                    
        UserDefaults.standard.set(user?.id, forKey: "id")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(user?.fullName, forKey: "fullName")
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
}
