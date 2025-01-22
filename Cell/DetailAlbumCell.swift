//
//  DetailAlbumCell.swift
//  ZooApp
//
//  Created by Narmin Alasova on 11.01.25.
//

import UIKit

class DetailAlbumCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
    }
    
    func configure(image: String ) {
        self.image.image = UIImage(named: image)
    }
}
