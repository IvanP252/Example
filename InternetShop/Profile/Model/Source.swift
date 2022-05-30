//
//  Source.swift
//  InternetShop
//
//  Created by Mac on 27.05.2022.
//

import Foundation
import UIKit

protocol SourceProtocol {
    var name: String { get set }
    var secondName: String { get set }
}

struct Source: SourceProtocol {
    var name: String
    var secondName: String
}
