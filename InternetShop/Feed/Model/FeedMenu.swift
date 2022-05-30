//
//  FeedMenu.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import Foundation
import UIKit.UIImage

struct FeedMenu {
    static func get() -> [FeedSource] {
        return [
            FeedSource(name: "Red Apple", icon: #imageLiteral(resourceName: "apple")),
            FeedSource(name: "Banana", icon: #imageLiteral(resourceName: "banana")),
            FeedSource(name: "Grapes", icon: #imageLiteral(resourceName: "grapes")),
            FeedSource(name: "Garnet", icon: #imageLiteral(resourceName: "garnet")),
            FeedSource(name: "Green Apple", icon: #imageLiteral(resourceName: "green_apple")),
            FeedSource(name: "Kiwi", icon: #imageLiteral(resourceName: "kiwi")),
            FeedSource(name: "Green Pears", icon: #imageLiteral(resourceName: "green_pears")),
            FeedSource(name: "Mango", icon: #imageLiteral(resourceName: "mango")),
            FeedSource(name: "Orange", icon: #imageLiteral(resourceName: "orange")),
            FeedSource(name: "Sliced Mango", icon: #imageLiteral(resourceName: "mango2")),
            FeedSource(name: "Pears", icon: #imageLiteral(resourceName: "pears")),
            FeedSource(name: "Pineapple", icon: #imageLiteral(resourceName: "pineapple")),
            FeedSource(name: "Pomelo", icon: #imageLiteral(resourceName: "pomelo") )
        ]
    }
}
