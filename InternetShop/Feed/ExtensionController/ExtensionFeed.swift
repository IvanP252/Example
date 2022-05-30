//
//  ExtensionFeed.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import UIKit

extension FeedViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

// MARK: UICollectionViewDataSource and UICollectionViewDelegate

extension FeedViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering {
            return filter.count
        }
        
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.reuseID, for: indexPath) as? FeedCollectionViewCell else {
            fatalError("Wrong cell")
        }
        
        var name: FeedSource
        
        if isFiltering {
            name = filter[indexPath.row]
        } else {
            name = dataSource[indexPath.row]
        }
        
        cell.update(title: name.name, image: name.icon)
        
        return cell
    }
}

