//
//  CatalogViewController.swift
//  InternetShop
//
//  Created by Mac on 18.05.2022.
//

import UIKit

class CatalogViewController: UIViewController {
    
    // MARK: property
    
    var tableView = UITableView()
    
    let identifire = "MyCell"
    var listShop = [List]()
    var storage = Storage.shared
    
    var itemArray: [List] = []
    
    //search property
    let searchController = UISearchController(searchResultsController: nil)
    var filter: [List] = []
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    //MARK: life cycle viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        storage = Storage.shared
        
        createTableView()
        creatAddButton()
        createEditButton()
        settingsSearch()
        
        loadData()
    }
    
    //MARK: settingsSearch
    private func settingsSearch() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        
        searchController.searchBar.placeholder = "Поиск..."
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    //MARK: createTableView
    private func createTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
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
    
    //MARK: loadData()
    private func loadData() {
        var items = storage.lists
        items.sort { $0.name < $1.name }
        itemArray = items
        tableView.reloadData()
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
            let list = List(name: itemName, products: [])
            self.storage.lists.append(list)
            self.storage.save()
            self.loadData()
        }
        
        let actionCancel = UIAlertAction(title: "Отмена",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(actionCreate)
        alertController.addAction(actionCancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: EditButton
    func createEditButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handlerEditButton))
    }
    
    @objc func handlerEditButton() {
        tableView.isEditing = !tableView.isEditing
    }
    
    //MARK: filterSearchText
    func filterContentForSearchText(_ searchText: String) {
        filter = itemArray.filter({ (name: List) in
            return name.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
