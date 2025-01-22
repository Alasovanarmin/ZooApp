//
//  ArticleSliderCell.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import UIKit

class ArticleSliderCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        
        layer.cornerRadius = 20
    }
    
    func configure(article: Article) {
        nameLabel.text = article.name
        
        if let headerImage = article.headerImage {
            image.image = UIImage(named: headerImage)
        }
        
    }

}
