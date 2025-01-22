//
//  HomeController.swift
//  ZooApp
//
//  Created by Narmin Alasova on 02.01.25.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        configureNavItem()
    }
    
    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(ArticleCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ArticleCell.self)")
        
        collection.register(
            UINib(nibName: "\(HomeHeaderReusableView.self)", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderReusableView"
        )
        collection.register(
            UINib(nibName: "\(HomeFooterReusableView.self)", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "HomeFooterReusableView"
        )
    }
    
    func configureNavItem() {
        let profileImage = UIImageView(image: UIImage(named: "profile"))
        profileImage.layer.cornerRadius = 18
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 2
        profileImage.contentMode = .scaleAspectFill
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
//
//
//        NSLayoutConstraint.activate([
//            profileImage.widthAnchor.constraint(equalToConstant: 36),
//            profileImage.heightAnchor.constraint(equalToConstant: 36)
//        ])
        
        let greetingLabel = UILabel()
        greetingLabel.text = "Hello Narmin"
        greetingLabel.textAlignment = .left
        greetingLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        greetingLabel.textColor = .white
        greetingLabel.sizeToFit()
        
        let subGreetingLabel = UILabel()
        subGreetingLabel.text = "Have a nice day"
        subGreetingLabel.textAlignment = .left
        subGreetingLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subGreetingLabel.textColor = .lightGray
        subGreetingLabel.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, subGreetingLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
                    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImage)
    }
    
    
}
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getRecommendedArticles().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ArticleCell.self)", for: indexPath) as! ArticleCell
        
        cell.configure(article: viewModel.getArticleByIndex(index: indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collection.frame.width / 2 - 8
      
        return CGSize(width: width, height: width + 90)
//        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(DetailController.self)") as! DetailController
        
        controller.configure(article: viewModel.getArticleByIndex(index: indexPath.row))
        controller.refreshAllArticlesAction = {
            self.viewModel.refreshArticles()
            
            self.collection.reloadData()
        }
        
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HomeHeaderReusableView.self)", for: indexPath) as! HomeHeaderReusableView
            
            header.configure(articles: viewModel.getSliderArticles())
            header.configure(articleCategories: viewModel.getArticleCategories())
            
            header.categorySegmentChangedAction = {  selectedCategory in
                self.viewModel.filterRecommendedArticles(category: selectedCategory)
                
                self.collection.reloadData()
            }
            
            header.showAllButtonTappedAction = {
                if let tabBarController = self.tabBarController {
                    tabBarController.selectedIndex = 1
                }
            }
            
            return header
        }
        else if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HomeFooterReusableView.self)", for: indexPath) as! HomeFooterReusableView
            
            footer.configure(articles: viewModel.getFooterArticles())
            
            footer.showAllButtonTappedAction = {
                if let tabBarController = self.tabBarController {
                    tabBarController.selectedIndex = 1
                }
            }
            
            return footer
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 150)
    }
}
