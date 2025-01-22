//
//  DetailCell.swift
//  ZooApp
//
//  Created by Narmin Alasova on 11.01.25.
//

import UIKit

class DetailCell: UICollectionViewCell {
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(overview: String) {
        overviewLabel.text = overview
    }
}
