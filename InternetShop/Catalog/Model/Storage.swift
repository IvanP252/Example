//
//  Storage.swift
//  InternetShop
//
//  Created by Mac on 24.05.2022.
//

import Foundation

class Storage {
    
    static let shared: Storage = .init()
    
    public var lists: [List] = [] {
        didSet {
            save()
        }
    }
    
    private var storage = UserDefaults.standard
    //key for save
    private var storageKey = "lists"
    
    private lazy var decoder: JSONDecoder = .init()
    
    private lazy var encoder: JSONEncoder = .init()
    
    init() {
        guard let data = storage.data(forKey: storageKey) else {
            return
        }
        do {
            lists = try decoder.decode([List].self, from: data)
        }
        catch {
            print("Ошибка декодирования сохранённых листов", error)
        }
    }
    
    func save() {
        do {
            let data = try encoder.encode(lists)
            storage.setValue(data, forKey: storageKey)
            storage.synchronize()
        }
        catch {
            print("Ошибка кодирования листов для сохранения", error)
        }
    }
}
