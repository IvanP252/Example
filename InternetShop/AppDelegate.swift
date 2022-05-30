//
//  AppDelegate.swift
//  InternetShop
//
//  Created by Mac on 18.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let feed = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let catalog = CatalogViewController()
        let basket = BasketViewController()
        let profile = ProfileViewController()
        
        let feedNav = UINavigationController(rootViewController: feed)
        feedNav.navigationItem.title = "Лента"
        feedNav.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let catalogNav = UINavigationController(rootViewController: catalog)
        catalogNav.navigationItem.title = "Каталог"
        catalogNav.tabBarItem.image = UIImage(systemName: "rectangle.and.text.magnifyingglass")
        
        let basketNav = UINavigationController(rootViewController: basket)
        basketNav.navigationItem.title = "Корзина"
        basketNav.tabBarItem.image = UIImage(systemName: "cart")
        
        let profileNav = UINavigationController(rootViewController: profile)
        profileNav.navigationItem.title = "Профиль"
        profileNav.tabBarItem.image = UIImage(systemName: "person.circle")
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([feedNav, catalogNav, basketNav, profileNav], animated: true)
        
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

