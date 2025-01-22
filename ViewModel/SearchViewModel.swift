//
//  SearchViewModel.swift
//  ZooApp
//
//  Created by Narmin Alasova on 08.01.25.
//
import Foundation

class SearchViewModel {
    private var articles: [Article] = []
    
    private var articleHelper = ArticleHelper(context: AppDelegate().persistentContainer.viewContext)
    
    init () {
        articles = articleHelper.getArticles()
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
    
    func getArticleByName(name: String?) {
        let allArticles = articleHelper.getArticles()
        
        if name == nil || name == "" {
            articles = allArticles
            
            return
        }
        
        guard let searchText = name?.lowercased() else {return}
        
        articles = allArticles.filter {$0.name?.lowercased().contains(searchText) ?? false}
    }
}

