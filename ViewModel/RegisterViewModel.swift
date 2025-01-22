//
//  RegisterViewModel.swift
//  ZooApp
//
//  Created by Narmin Alasova on 21.01.25.
//

import Foundation

class RegisterViewModel {
    private var fileManagerAdapter = FileManagerHelper()
    private var users = [User]()
    
    func getData() {
        self.users = fileManagerAdapter.readUserData()
    }
    
    func getLastUserId() -> Int {
        return users.last?.id ?? 0
    }
    
    func saveUserData(user: User) {
        users.append(user)
        fileManagerAdapter.writeUserData(users: users)
    }
    
}
