//
//  List.swift
//  InternetShop
//
//  Created by Mac on 24.05.2022.
//

import Foundation

class List: Codable {
    var name: String
    var products: [String]
    
    init(name: String, products: [String]) {
        self.name = name
        self.products = products
    }
}
