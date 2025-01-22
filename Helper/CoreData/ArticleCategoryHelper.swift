//
//  ArticleCategoryHelper.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import Foundation
import CoreData

class ArticleCategoryHelper {
//    let context = AppDelegate().persistentContainer.viewContext
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getCategories() -> [ArticleCategory] {
        do {
            return try context.fetch(ArticleCategory.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func saveCategory(name: String) -> ArticleCategory {
        
        let newCategory = ArticleCategory(context: context)
        newCategory.name = name
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return newCategory
    }
}
