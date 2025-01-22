//
//  ArticleCell.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        
        layer.cornerRadius = 20
    }
    
    func configure(article: Article) {
        info.text = article.name
        
        if let headerImage = article.headerImage {
            image.image = UIImage(named: headerImage)
        }
    }
}
