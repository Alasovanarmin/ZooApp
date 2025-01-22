//
//  HomeFooterReusableView.swift
//  ZooApp
//
//  Created by Narmin Alasova on 05.01.25.
//

import UIKit

class HomeFooterReusableView: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var showAll: UIButton!
    
    var articles: [Article] = []
    
    var showAllButtonTappedAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        configureButton()
    }
    
    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(ArticleFooterCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ArticleFooterCell.self)")
    }
    
    func configure(articles: [Article]) {
        self.articles = articles
    }
    
    @IBAction func showAllButtonTapped(_ sender: Any) {
        showAllButtonTappedAction?()
    }
    
    func configureButton() {
        // Set new width and height for the button
        let newWidth: CGFloat = 200
        let newHeight: CGFloat = 50
        
            // Update the button's frame
        showAll.frame = CGRect(x: showAll.frame.origin.x,
                                   y: showAll.frame.origin.y,
                                   width: newWidth,
                                   height: newHeight)
    }
}
extension HomeFooterReusableView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ArticleFooterCell.self)", for: indexPath) as! ArticleFooterCell
        
        cell.configure(article: articles[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
