//
//  HomeViewModel.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import Foundation

class HomeViewModel {
    private var recommendedArticles: [Article] = []
    private var sliderArticles: [Article] = []
    private var footerArticles: [Article] = []
    private var articleCategories: [ArticleCategory] = []
    
    private var articleHelper = ArticleHelper(context: AppDelegate().persistentContainer.viewContext)
    private var articleCategoryHelper = ArticleCategoryHelper(context: AppDelegate().persistentContainer.viewContext)
    
    init() {
        setRecommendedArticles()
        setSliderArticles()
        setArticleCategories()
        setFooterArticles()
    }
    
    func refreshArticles() {
        articleHelper = ArticleHelper(context: AppDelegate().persistentContainer.viewContext)
        
        setRecommendedArticles()
        setSliderArticles()
        setFooterArticles()
    }
    
    func setRecommendedArticles() {
        let articles = articleHelper.getArticles()
        recommendedArticles = Array(articles.prefix(2))
    }
    
    func getRecommendedArticles() -> [Article] {
        recommendedArticles
    }
    
    func getArticleByIndex(index: Int) -> Article {
        recommendedArticles[index]
    }
    
    func setSliderArticles() {
        let articles = articleHelper.getArticles()
        sliderArticles = Array(articles.prefix(4))
    }
    
    func getSliderArticles() -> [Article] {
        sliderArticles
    }
    
    func getSliderArticlesByIndex(index: Int) -> Article {
        sliderArticles[index]
    }
    
    func setArticleCategories() {
        let categories = articleCategoryHelper.getCategories()
        articleCategories = categories
    }
    
    func getArticleCategories() -> [ArticleCategory] {
        articleCategories
    }
    
    func setFooterArticles() {
        let articles = articleHelper.getArticles()
        footerArticles = Array(articles.suffix(from: 2).prefix(1))
    }
    
    func getFooterArticles() -> [Article] {
        footerArticles
    }
    
    func filterRecommendedArticles(category: ArticleCategory?) {
        let articles = articleHelper.getArticles()
        
        if category == nil {
            recommendedArticles = Array(articles.prefix(2))
            return
        }
        
        let filteredArticles = articles.filter{
            $0.category?.name == category?.name
        }
        
        recommendedArticles = Array(filteredArticles.prefix(2))
    }
}
