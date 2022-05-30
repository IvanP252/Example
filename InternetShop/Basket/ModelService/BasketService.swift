//
//  BasketService.swift
//  InternetShop
//
//  Created by Artem Novichkov on 29.05.2022.
//

import Foundation

class BasketService {
    
    static let shared: BasketService = .init()
    
    class BasketItem {
        let feedSource: FeedSource
        var count: Int
        
        init(feedSource: FeedSource, count: Int) {
            self.feedSource = feedSource
            self.count = count
        }
    }
    
    var items: [BasketItem] = []
}
