//
//  HomeHeaderReusableView.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import UIKit

class HomeHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var showAllButton: UIButton!
    
    var articles: [Article] = []
    var articleCategories: [ArticleCategory] = []
    var categorySegmentChangedAction: ((ArticleCategory?) -> Void)?
    var lastSelectedcategoryIndex: Int = 0
    var currentPage: Int = 0
    
    var showAllButtonTappedAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        configureButton()
    }
    
    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(ArticleSliderCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ArticleSliderCell.self)")
    }
    
    func setupCategorySegment() {
        categorySegment.removeAllSegments()
        
        categorySegment.insertSegment(withTitle: "All", at: categorySegment.numberOfSegments, animated: false)
        
        for category in articleCategories {
            categorySegment.insertSegment(withTitle: category.name, at: categorySegment.numberOfSegments, animated: false)
        }
        
        categorySegment.selectedSegmentIndex = lastSelectedcategoryIndex
        categorySegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        categorySegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let newPage = Int(scrollView.contentOffset.x / pageWidth + 0.5)

        if newPage != currentPage {
            currentPage = newPage

            changeSegmentActive(index: newPage)
        }
    }
    
    func changeSegmentActive(index: Int) {
        pageController.currentPage = index
    }
    
    func configure(articles: [Article]) {
        self.articles = articles
    }
    
    func configure(articleCategories: [ArticleCategory]) {
        self.articleCategories = articleCategories
        setupCategorySegment()
    }
    
    @IBAction func showAllButtontapped(_ sender: Any) {
        showAllButtonTappedAction?()
    }
    
    func configureButton() {
        // Set new width and height for the button
        let newWidth: CGFloat = 200
        let newHeight: CGFloat = 50
        
            // Update the button's frame
        showAllButton.frame = CGRect(x: showAllButton.frame.origin.x,
                                   y: showAllButton.frame.origin.y,
                                   width: newWidth,
                                   height: newHeight)
    }
    
    @IBAction func categorySegmentChanged(_ sender: Any) {
        var selectedIndex = categorySegment.selectedSegmentIndex
        var selectedCategory: ArticleCategory?
        
        if selectedIndex == 0 {
            selectedCategory = nil
        }
        else {
            selectedCategory = articleCategories[selectedIndex - 1]
        }
        
        lastSelectedcategoryIndex = selectedIndex
        categorySegmentChangedAction?(selectedCategory)
    }
    
    
}
extension HomeHeaderReusableView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ArticleSliderCell.self)", for: indexPath) as! ArticleSliderCell
        cell.configure(article: articles[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
}
