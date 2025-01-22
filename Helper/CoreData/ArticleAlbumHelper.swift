//
//  ArticleAlbumHelper.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import Foundation
import CoreData

class ArticleAlbumHelper {
//    let context = AppDelegate().persistentContainer.viewContext
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getAlbums() -> [ArticleAlbum] {
        do {
            return try context.fetch(ArticleAlbum.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func saveAlbum(name: String, article: Article) -> ArticleAlbum {
        
        let newAlbum = ArticleAlbum(context: context)
        newAlbum.article = article
        newAlbum.image = name
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return newAlbum
    }
}

