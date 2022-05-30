//
//  ExtensionBasketViewController.swift
//  InternetShop
//
//  Created by Mac on 29.05.2022.
//

import UIKit

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let item = BasketService.shared.items
        return item.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let configuration = cell.defaultContentConfiguration()
        //        let item = BasketService.shared.items[indexPath.row]
        //        nameLabel.text = item.feedSource.name
        //        imageView.image = item.feedSource.icon
        //        countLabel.text = String(item.count)
        
        cell.contentConfiguration = configuration
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
