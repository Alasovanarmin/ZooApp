//
//  DetailController.swift
//  ZooApp
//
//  Created by Narmin Alasova on 11.01.25.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    private var viewModel = DetailViewModel()
    
    var lastSelectedSegmentIndex: Int = 0
    var heartImage: String = "heart"
    
    var refreshAllArticlesAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavItem()
        setupCollectionView()
    }
    
    func configure(article: Article) {
        viewModel.setArticle(article: article)
        
        heartImage = article.isFavorite ? "heart.fill" : "heart"
        
        configureNavItem()
    }
    
    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(DetailCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DetailCell.self)")
        collection.register(UINib(nibName: "\(DetailAlbumCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DetailAlbumCell.self)")
        
        collection.register(
            UINib(nibName: "\(DetailHeaderReusableView.self)", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DetailHeaderReusableView"
        )
    }
    
    func configureNavItem() {
        let likeBarButtonTapped = UIBarButtonItem(
            image: UIImage(systemName: heartImage),
            style: .plain,
            target: self,
            action: #selector(likeBarButtonTapped)
        )
        likeBarButtonTapped.tintColor = .systemPink
        
        self.navigationItem.rightBarButtonItem = likeBarButtonTapped
    }
    
    @objc func likeBarButtonTapped() {
        var isFavorite = false
        
        if heartImage == "heart" {
            heartImage = "heart.fill"
            
            isFavorite = true
        }
        else {
            heartImage = "heart"
        }
        
        viewModel.updateIsfavorite(article: viewModel.getArticle(), isFavorite: isFavorite)
        refreshAllArticlesAction?()
        
        configureNavItem()
    }
}
extension DetailController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if lastSelectedSegmentIndex == 0 {
            return 1
        }
        else if lastSelectedSegmentIndex == 1 {
            return viewModel.getArticle()?.albums?.count ?? 0
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if lastSelectedSegmentIndex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailCell.self)", for: indexPath) as! DetailCell
            
            cell.configure(overview: viewModel.getArticle()?.overview ?? "")
            
            return cell
        }
        else if lastSelectedSegmentIndex == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailAlbumCell.self)", for: indexPath) as! DetailAlbumCell
                                    
            if let albumsSet = viewModel.getArticle()?.albums as? NSSet {
                var albumsArray = albumsSet.allObjects as? [ArticleAlbum]
                
                cell.configure(image: albumsArray?[indexPath.row].image ?? "")
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if lastSelectedSegmentIndex == 0 {
            return .init(width: collectionView.frame.width, height: collectionView.frame.width)
        }
        else if lastSelectedSegmentIndex == 1 {
            return .init(width: collectionView.frame.width - 20, height: 200)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(DetailHeaderReusableView.self)", for: indexPath) as! DetailHeaderReusableView
        
        header.segmentChangedAction = { selectedSegmentIndex in
            self.lastSelectedSegmentIndex = selectedSegmentIndex
            
            self.collection.reloadData()
        }
        
        if let article = viewModel.getArticle() {
            header.configure(article: article)
        }
    
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 450)
    }
}
