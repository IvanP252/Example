//
//  FeedModel.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import Foundation
import UIKit.UIImage

protocol FeedModelProtocol {
    var name: String { get set }
    var icon: UIImage { get set }
}

struct FeedSource: FeedModelProtocol {
    var name: String
    var icon: UIImage
}
