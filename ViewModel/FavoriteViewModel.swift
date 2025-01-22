//
//  FavoriteViewModel.swift
//  ZooApp
//
//  Created by Narmin Alasova on 21.01.25.
//

import Foundation

class FavoriteViewModel {
    private var articles: [Article] = []
    
    private var articleHelper = ArticleHelper(context: AppDelegate().persistentContainer.viewContext)
    
    init () {
        var allArticles = articleHelper.getArticles()
        
        articles = allArticles.filter {$0.isFavorite == true}
    }
    
    func getArticles() -> [Article] {
        articles
    }
    
    func articleCount() -> Int {
        articles.count
    }
    
    func getArticleByIndex(index: Int) -> Article {
        articles[index]
    }
}
