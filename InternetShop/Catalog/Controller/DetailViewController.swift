//
//  DetailViewController.swift
//  InternetShop
//
//  Created by Mac on 25.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    let list: List
    
    init(list: List) {
        self.list = list
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView = UITableView()
    let identifireNew = "cellDetail"
    
    var storageNew = Storage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createTableView()
        creatAddButton()
        
    }
    
    //MARK: createTableView
    private func createTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifireNew)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    //MARK: creatAddButton
    func creatAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
    }
    
    @objc private func addButton() {
        showNewCreateItemListShop()
    }
    
    //MARK: showNewItemListShop()
    func showNewCreateItemListShop() {
        
        let alertController = UIAlertController(title: "Создание новой позиции.",
                                                message: "Введите название",
                                                preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Название"
        }
        
        let actionCreate = UIAlertAction(title: "Создать",
                                         style: .default) { (_) in
            guard let itemName = alertController.textFields?[0].text else {
                return
            }
            self.list.products.append(itemName)
            self.storageNew.save()
            self.tableView.reloadData()
        }
        
        let actionCancel = UIAlertAction(title: "Отмена",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(actionCreate)
        alertController.addAction(actionCancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
