//
//  ArticleCategory+CoreDataProperties.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//
//

import Foundation
import CoreData


extension ArticleCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleCategory> {
        return NSFetchRequest<ArticleCategory>(entityName: "ArticleCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var articles: NSSet?

}

// MARK: Generated accessors for articles
extension ArticleCategory {

    @objc(addArticlesObject:)
    @NSManaged public func addToArticles(_ value: Article)

    @objc(removeArticlesObject:)
    @NSManaged public func removeFromArticles(_ value: Article)

    @objc(addArticles:)
    @NSManaged public func addToArticles(_ values: NSSet)

    @objc(removeArticles:)
    @NSManaged public func removeFromArticles(_ values: NSSet)

}

extension ArticleCategory : Identifiable {

}
