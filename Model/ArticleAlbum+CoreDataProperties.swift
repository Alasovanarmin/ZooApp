//
//  ArticleAlbum+CoreDataProperties.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//
//

import Foundation
import CoreData


extension ArticleAlbum {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleAlbum> {
        return NSFetchRequest<ArticleAlbum>(entityName: "ArticleAlbum")
    }

    @NSManaged public var image: String?
    @NSManaged public var article: Article?

}

extension ArticleAlbum : Identifiable {

}
