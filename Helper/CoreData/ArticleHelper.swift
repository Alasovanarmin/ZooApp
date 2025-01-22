//
//  ArticleHelper.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import Foundation
import CoreData

class ArticleHelper {
    //let context = AppDelegate().persistentContainer.viewContext
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getArticles() -> [Article] {
        do {
            return try context.fetch(Article.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func saveArticle(name: String, headerImage: String, overview: String, publishedDate: String, author: String, category: ArticleCategory) -> Article {
        
        let newArticle = Article(context: context)
        newArticle.name = name
        newArticle.category = category
        newArticle.headerImage = headerImage
        newArticle.overview = overview
        newArticle.publishedDate = publishedDate
        newArticle.author = author
       
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return newArticle
    }
    
    func updateArticleFavorite(article: Article, isFavorite: Bool) {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", article.name ?? "")
        
        do {
            let articles = try context.fetch(fetchRequest)
            
            if let existingArticle = articles.first {
                
                existingArticle.isFavorite = isFavorite
                
                try context.save()
            }
        } catch {
            print("Failed to fetch or update article: \(error.localizedDescription)")
        }
    }
}
