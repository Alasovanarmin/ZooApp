//
//  fakeData.swift
//  ZooApp
//
//  Created by Narmin Alasova on 19.01.25.
//

import Foundation

class FakeData {
    func generateDummyData() {
        let context = AppDelegate().persistentContainer.viewContext
        
        let categories = ArticleCategoryHelper(context: context).getCategories()
        print(categories)
        if !categories.isEmpty {
            return
        }
        
        let wild = ArticleCategoryHelper(context: context).saveCategory(name: "Wild")
        let domestic = ArticleCategoryHelper(context: context).saveCategory(name: "Domestic")
        let pet = ArticleCategoryHelper(context: context).saveCategory(name: "Pet")
        
        let elephant = ArticleHelper(context: context).saveArticle(
            name: "Elepahnt in Africa",
            headerImage: "elephant",
            overview: "Elephants are the largest living mammals on Earth. They are found in Africa, Asia, and Oceania. Elephants are herbivores that eat leaves, fruits, and flowers.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: wild
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "elephant2",
            article: elephant
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "elephant3",
            article: elephant
        )
        
        let penguin = ArticleHelper(context: context).saveArticle(
            name: "Penguins in Antractica",
            headerImage: "penguins",
            overview: "Penguins are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. penguins are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: wild
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "penguin2",
            article: penguin
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "penguin3",
            article: penguin
        )
        
        let lion = ArticleHelper(context: context).saveArticle(
            name: "Lion in Africa",
            headerImage: "lion",
            overview: "Lions are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. lions are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: wild
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "lion2",
            article: lion
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "lion3",
            article: lion
        )
        
        let dog = ArticleHelper(context: context).saveArticle(
            name: "Dog in America",
            headerImage: "dog",
            overview: "Dogs are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. Dogs are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: pet
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "dog2",
            article: dog
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "dog3",
            article: dog
        )
        
        let cat = ArticleHelper(context: context).saveArticle(
            name: "Cat in America",
            headerImage: "cat",
            overview: "Cats are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. Cats are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: pet
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "cat2",
            article: cat
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "cat3",
            article: cat
        )
        
        let bird = ArticleHelper(context: context).saveArticle(
            name: "Bird in America",
            headerImage: "bird",
            overview: "Birds are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. Birds are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: wild
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "bird2",
            article: bird
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "bird3",
            article: bird
        )
        
        let turtle = ArticleHelper(context: context).saveArticle(
            name: "Turtle in America",
            headerImage: "turtle",
            overview: "Turtles are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. turtles are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: wild
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "turtle2",
            article: turtle
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "turtle3",
            article: turtle
        )
        
        let pig = ArticleHelper(context: context).saveArticle(
            name: "Pig in America",
            headerImage: "pig",
            overview: "Pigs are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. pigs are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: domestic
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "pig2",
            article: pig
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "pig3",
            article: pig
        )
        
        let cow = ArticleHelper(context: context).saveArticle(
            name: "Cow in America",
            headerImage: "cow",
            overview: "Cows are the most popular pets in the United States. They are found in all states and territories except for Alaska and Hawaii. cows are carnivores that eat meat, fish, and insects.",
            publishedDate: "May 13, 2020",
            author: "Michael Jackson",
            category: domestic
        )
        
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "cow2",
            article: cow
        )
        let _ = ArticleAlbumHelper(context: context).saveAlbum(
            name: "cow3",
            article: cow
        )
    }
}

