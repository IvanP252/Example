//
//  DetFruitViewController.swift
//  InternetShop
//
//  Created by Mac on 29.05.2022.
//

import UIKit

class DetFruitViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var buyButton: UIButton = {
        buyButton = UIButton()
        buyButton.backgroundColor = UIColor.systemBlue
        buyButton.setTitle("Купить", for: .normal)
        buyButton.setTitleColor(UIColor.black, for: .normal)
        buyButton.layer.cornerRadius = 15
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        return buyButton
    }()
    
    let feedSource: FeedSource
    
    init(feedSource: FeedSource) {
        self.feedSource = feedSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = feedSource.name
        imageView.image = feedSource.icon
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(imageView)
        self.view.addSubview(buyButton)
        
        buyButton.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        
        nameLabelConstraint()
        imageViewConstraint()
        buttonConstraint()
    }
    
    
    func nameLabelConstraint() {
        nameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func imageViewConstraint() {
        imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.center = nameLabel.center
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func buttonConstraint() {
        buyButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc private func addToBasket() {
        let item = BasketService.shared.items.first { item in
            item.feedSource.name == feedSource.name
        }
        if let addedItem = item {
            addedItem.count += 1
            return
        }
        let basketItem = BasketService.BasketItem(feedSource: feedSource, count: 1)
        BasketService.shared.items.append(basketItem)
        showMessageAddToBasket()
    }
    
    private func showMessageAddToBasket() {
        let alertController = UIAlertController(title: nil,
                                                message: "Товар добавлен в корзину",
                                                preferredStyle: .alert)
        self.present(alertController, animated: true) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
