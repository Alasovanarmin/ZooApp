//
//  DetailViewModel.swift
//  ZooApp
//
//  Created by Narmin Alasova on 11.01.25.
//

import Foundation

class DetailViewModel {
    private var article: Article?
    
    private var articleHelper = ArticleHelper(context: AppDelegate().persistentContainer.viewContext)
    
    func setArticle(article: Article) {
        self.article = article
    }
    
    func getArticle() -> Article? {
         article
    }
    
    func updateIsfavorite(article: Article?, isFavorite: Bool) {
        if let articleNotNil = article {
            articleHelper.updateArticleFavorite(article: articleNotNil, isFavorite: isFavorite)
        }
    }
}
