//
//  RowViewController.swift
//  InternetShop
//
//  Created by Mac on 29.05.2022.
//

import UIKit

class RowViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = UIColor.black
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = UIColor.gray.cgColor
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(nameLabel)
        
        nameLabelConstraint()
    }
    
    func nameLabelConstraint() {
        nameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
