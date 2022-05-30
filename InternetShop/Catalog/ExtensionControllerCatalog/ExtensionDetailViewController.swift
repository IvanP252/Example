//
//  ExtensionDetailViewController.swift
//  InternetShop
//
//  Created by Mac on 25.05.2022.
//

import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireNew, for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = list.products[indexPath.row]
        cell.accessoryType = .detailButton
        
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        _ = list.products[indexPath.row]
        let vcInfo = InfoViewController()
        self.present(vcInfo, animated: true) {
            vcInfo.createAlertInfo()
        }
        tableView.reloadData()
    }
    
    // swipe delete
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.list.products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
