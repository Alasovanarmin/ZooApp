//
//  FileManagerHelper.swift
//  ZooApp
//
//  Created by Narmin Alasova on 21.01.25.
//

import Foundation

class FileManagerHelper {
    func getFilePathInDocument(fileName: String) -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let fileURL = files[0].appendingPathComponent(fileName)
        
        print(fileURL)
        
        return fileURL
    }
    
    func readUserData() -> [User] {
        let filePath = getFilePathInDocument(fileName: "users.json")
        
        if let dataJson = try? Data(contentsOf: filePath),
           let data = try? JSONDecoder().decode([User].self, from: dataJson) {
            return data
        }
        
        return []
    }
    
    func writeUserData(users: [User])
    {
        let jsonUsers = try! JSONEncoder().encode(users)
        let filePath = getFilePathInDocument(fileName: "users.json")
        
        do {
            try jsonUsers.write(to: filePath)
        } catch {
            
        }
    }
}
