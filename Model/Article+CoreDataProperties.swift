//
//  Article+CoreDataProperties.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var name: String?
    @NSManaged public var author: String?
    @NSManaged public var publishedDate: String?
    @NSManaged public var overview: String?
    @NSManaged public var headerImage: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var albums: NSSet?
    @NSManaged public var category: ArticleCategory?

}

// MARK: Generated accessors for albums
extension Article {

    @objc(addAlbumsObject:)
    @NSManaged public func addToAlbums(_ value: ArticleAlbum)

    @objc(removeAlbumsObject:)
    @NSManaged public func removeFromAlbums(_ value: ArticleAlbum)

    @objc(addAlbums:)
    @NSManaged public func addToAlbums(_ values: NSSet)

    @objc(removeAlbums:)
    @NSManaged public func removeFromAlbums(_ values: NSSet)

}

extension Article : Identifiable {

}
