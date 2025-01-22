//
//  SearchController.swift
//  ZooApp
//
//  Created by Narmin Alasova on 08.01.25.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        configureNavItem()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        viewModel.getArticleByName(name: search.text!)
        
        collection.reloadData()
    }
    
    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(
            UINib(nibName: "\(ArticleCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ArticleCell.self)"
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
extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.articleCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ArticleCell.self)", for: indexPath) as! ArticleCell
        
        cell.configure(article: viewModel.getArticleByIndex(index: indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(DetailController.self)") as! DetailController
        
        controller.configure(article: viewModel.getArticleByIndex(index: indexPath.row))
        
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: collectionView.frame.width, height: 200)
        let width = collection.frame.width - 16
        return CGSize(width: width, height: width - 50)
    }
}
