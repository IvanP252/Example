//
//  ProfileViewController.swift
//  InternetShop
//
//  Created by Mac on 18.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let url = URL(string: "https://coolsen.ru/wp-content/uploads/2021/06/20-7.jpg")!
    
    var avatarImageView = UIImageView()
    var updateButton = UIButton()
    var nameLabel = UILabel()
    var secondNameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        createAvatarImageView()
        createNameLable()
        createSecondNameLable()
        createUpdateButton()
        
        avatarImageViewConstraint()
        nameLabelConstraint()
        secondNameLabelConstraint()
        updateButtonConstraint()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(addName))
        
        updateButton.addTarget(self, action: #selector(handlerUpdateButton), for: .touchUpInside)
    }
    
    private func createAvatarImageView() {
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 57
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.orange.cgColor
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(avatarImageView)
    }
    
    private func createUpdateButton() {
        updateButton.backgroundColor = UIColor.systemBlue
        updateButton.setTitleColor(UIColor.black, for: .normal)
        updateButton.setTitle("Обновить", for: .normal)
        updateButton.layer.cornerRadius = 20
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(updateButton)
    }
    
    private func createNameLable() {
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        nameLabel.textColor = UIColor.black
        nameLabel.layer.borderColor = UIColor.orange.cgColor
        nameLabel.layer.borderWidth = 0.2
        nameLabel.layer.cornerRadius = 10
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
    }
    
    private func createSecondNameLable() {
        secondNameLabel.adjustsFontSizeToFitWidth = true
        secondNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        secondNameLabel.textColor = UIColor.black
        secondNameLabel.layer.borderColor = UIColor.orange.cgColor
        secondNameLabel.layer.borderWidth = 0.2
        secondNameLabel.layer.cornerRadius = 10
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondNameLabel)
    }
    
    private func updateButtonConstraint() {
        updateButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30).isActive = true
        updateButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func avatarImageViewConstraint() {
        avatarImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
    }
    
    private func nameLabelConstraint() {
        nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    private func secondNameLabelConstraint() {
        secondNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 15).isActive = true
        secondNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        secondNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    @objc private func addName() {
        
        let alertController = UIAlertController(title: "Создание нового профиля",
                                                message: "Заполните поля",
                                                preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Введите имя"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Введите фамилию"
        }
        
        let createAction = UIAlertAction(title: "Создать",
                                         style: .default) { [weak self] (_) in
            guard let name = alertController.textFields?[0].text,
                  let secondName = alertController.textFields?[1].text else {
                return
            }
            let item = Source(name: name, secondName: secondName)
            self?.nameLabel.text = item.name
            self?.secondNameLabel.text = item.secondName
        }
        let cancelACtion = UIAlertAction(title: "Отмена",
                                         style: .cancel, handler: nil)
        
        alertController.addAction(createAction)
        alertController.addAction(cancelACtion)
        
        self.present(alertController, animated: true)
    }
    
    @objc private func handlerUpdateButton() {
        cacheData = nil
        avatarImageView.image = nil
        loadImage()
    }
    
    func loadImage() {
        let serviceImage = LoadImageService()
        let proxy = Proxy(service: serviceImage)
        
        proxy.loadImage(url: url) { [weak self] (data, responce, error) in
            guard let self = self, let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = UIImage(data: data)
            }
        }
    }
}
