//
//  ExtensionCatalogViewController.swift
//  InternetShop
//
//  Created by Mac on 22.05.2022.


import UIKit

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filter.count
        }
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        let name: List
        if isFiltering {
            name = filter[indexPath.row]
        } else {
            name = itemArray[indexPath.row]
        }
        
        cell.textLabel?.text = name.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let list = itemArray[indexPath.row]
        let vc = DetailViewController(list: list)
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.reloadData()
    }
    
    //MARK: edit
    
    // swipe delete & edit
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (_, _, _) in
            self?.itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        let actionEditing = UIContextualAction(style: .normal, title: "Изменить") {
            (_, _, _) in
            print("Editing")
        }
        
        let actions = UISwipeActionsConfiguration(actions: [actionDelete, actionEditing])
        return actions
    }
    
    //move row
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let newItem = itemArray[sourceIndexPath.row]
        itemArray.remove(at: sourceIndexPath.row)
        itemArray.insert(newItem, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // menu action copy
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) {
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let cell = tableView.cellForRow(at: indexPath)
            let paste = UIPasteboard.general
            paste.string = cell?.textLabel?.text
        }
    }
}

extension CatalogViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

