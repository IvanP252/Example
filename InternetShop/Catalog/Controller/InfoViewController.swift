//
//  InfoViewController.swift
//  InternetShop
//
//  Created by Mac on 25.05.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        createAlertInfo()
        
    }
    
    func createAlertInfo() {
        let alert = UIAlertController(title: "Здесь будет указана Ваша информация",
                                      message: "Сделайте запись",
                                      preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            self?.dismiss(animated: true)
        }
        
        alert.addAction(actionOK)
        
        self.present(alert, animated: true, completion: nil)
    }
}
