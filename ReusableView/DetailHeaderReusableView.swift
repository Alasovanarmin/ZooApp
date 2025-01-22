//
//  DetailheaderReusableView.swift
//  ZooApp
//
//  Created by Narmin Alasova on 11.01.25.
//

import UIKit

class DetailHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    private var lastSelectedSegmentIndex: Int = 0
    var segmentChangedAction: ((Int) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupSegment()
        addBlurEffect()
        
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
//        image.layer.cornerRadius = 20
        
        layer.cornerRadius = 20
    }
    
    func configure(article: Article) {
        nameLabel.text = article.name
        authorLabel.text = article.author
        publishedDateLabel.text = article.publishedDate
        
        if let image = article.headerImage {
            self.image.image = UIImage(named: image)
        }
    }
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        let blurHeight = image.bounds.height / 2.1
        let blurYPosition = image.bounds.height - blurHeight
        
        blurEffectView.frame = CGRect(x: 0, y: blurYPosition, width: image.bounds.width, height: blurHeight)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        
        blurEffectView.layer.shadowColor = UIColor.black.cgColor
        blurEffectView.layer.shadowOpacity = 0.4
        blurEffectView.layer.shadowOffset = CGSize(width: 0, height: -5)
        blurEffectView.layer.shadowRadius = 10
        
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.layer.masksToBounds = true
        
        image.addSubview(blurEffectView)
    }
    
    func setupSegment() {
        segment.removeAllSegments()
        
        for detailSegment in DetailSegment.allCases {
            segment.insertSegment(withTitle: detailSegment.rawValue, at: segment.numberOfSegments, animated: false)
        }
        
        segment.selectedSegmentIndex = lastSelectedSegmentIndex
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        lastSelectedSegmentIndex = segment.selectedSegmentIndex
        
        segmentChangedAction?(lastSelectedSegmentIndex)
    }
    
}
