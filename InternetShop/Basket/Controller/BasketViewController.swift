//
//  BasketViewController.swift
//  InternetShop
//
//  Created by Mac on 18.05.2022.
//

import UIKit

class BasketViewController: UIViewController {
    
    var tableView = UITableView ()
    let identifire = "basketCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    lazy var countLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createTableView()
        
        imageViewConstraint()
        nameLabelConstraint()
        countLabelConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for item in BasketService.shared.items {
            nameLabel.text = item.feedSource.name
            imageView.image = item.feedSource.icon
            countLabel.text = String(item.count)
        }
    }
    
    //MARK: createTableView
    func createTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.addSubview(imageView)
        tableView.addSubview(nameLabel)
        tableView.addSubview(countLabel)
        
        
        self.view.addSubview(tableView)
    }
    
    func imageViewConstraint() {
        imageView.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: 15).isActive = true
        imageView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func nameLabelConstraint() {
        nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 30).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30).isActive = true
    }
    
    func countLabelConstraint() {
        countLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10).isActive = true
        countLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        countLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 30).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30).isActive = true
    }
    
}
