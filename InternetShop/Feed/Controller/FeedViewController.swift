//
//  FeedViewController.swift
//  InternetShop
//
//  Created by Mac on 18.05.2022.
//

import UIKit

class FeedViewController: UICollectionViewController {
    
    //MARK: enum PresentationStyle
    private enum PresentationStyle: String, CaseIterable {
        case table
        case defaultStyle
        case customStyle
        
        var buttonImage: UIImage {
            switch self {
            case .table: return #imageLiteral(resourceName: "table")
            case .defaultStyle: return #imageLiteral(resourceName: "default_style")
            case .customStyle: return #imageLiteral(resourceName: "custom_style")
            }
        }
    }
    
    //MARK: property
    private var selectedStyle: PresentationStyle = .table {
        didSet {
            updatePresentationStyle()
        }
    }
    
    private var styleDelegates: [PresentationStyle: CollectionViewSelectDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectDelegate] = [
            .table: TableCollectionViewDelegat(),
            .defaultStyle: DefaultStyleCollectionViewDelegat(),
            .customStyle: CustomStyleCollectionViewDelegat(),
        ]
        return result
    }()
    
    var dataSource: [FeedSource] = FeedMenu.get()
    
    //MARK: property serch
    let searchVC = UISearchController(searchResultsController: nil)
    var filter: [FeedSource] = FeedMenu.get()
    var isSearchBarEmpty: Bool {
        return searchVC.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchVC.isActive && !isSearchBarEmpty
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsCollectionView()
        settingsNavigationBar()
        
        styleDelegates.values.forEach {
            $0.selectItem = { indexPath in
                let feedSource = self.dataSource[indexPath.row]
                let vc = DetFruitViewController(feedSource: feedSource)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    //MARK: - NavigationBar
    
    //MARK: settingsNavigationBar
    private func settingsNavigationBar() {
        self.view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(goNotification))
        
        searchVC.loadViewIfNeeded()
        searchVC.searchResultsUpdater = self
        searchVC.searchBar.delegate = self
        
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.enablesReturnKeyAutomatically = false
        searchVC.searchBar.returnKeyType = UIReturnKeyType.done
        
        searchVC.searchBar.placeholder = "Поиск..."
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchVC
        definesPresentationContext = true
        
    }
    
    //MARK: method for selector "bell" in navigationController
    @objc func goNotification() {
        let bellVC = BellViewController()
        navigationController?.pushViewController(bellVC, animated: true)
    }
    
    //MARK: - UICollectionView
    
    //MARK: updatePresentationStyle
    private func updatePresentationStyle() {
        collectionView.delegate = styleDelegates[selectedStyle]
        collectionView.performBatchUpdates ({
            collectionView.reloadData()
        }, completion: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: selectedStyle.buttonImage,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(changeContent))
    }
    
    //MARK: method changeContent for selector BarButtonItem
    @objc private func changeContent() {
        let allCases = PresentationStyle.allCases
        guard let index = allCases.firstIndex(of: selectedStyle) else {
            return
        }
        let nextIndex = (index + 1) % allCases.count
        selectedStyle = allCases[nextIndex]
    }
    
    // MARK: settingsUICollectionView()
    func settingsCollectionView() {
        self.collectionView.register(FeedCollectionViewCell.nib, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseID)
        collectionView.contentInset = .zero
        updatePresentationStyle()
    }
    
    //MARK: filterSearchText
    func filterContentForSearchText(_ searchText: String) {
        filter = dataSource.filter{ (name: FeedSource) in
            return name.name.lowercased().contains(searchText.lowercased())
        }
        collectionView.reloadData()
    }
}
