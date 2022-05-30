//
//  BellViewController.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import UIKit

class BellViewController: UIViewController {
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        alertMessage()
    }
    
    //MARK: alertMessage
    func alertMessage() {
        let alertController = UIAlertController(title: "У вас одно новое уведомление",
                                                message: nil,
                                                preferredStyle: .alert)
        
        let readAction = UIAlertAction(title: "Прочитать",
                                       style: .default) { [weak self] (_) in
            self?.readMessage()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(readAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    //MARK: handler for readAction
    func readMessage() {
        let alert = UIAlertController(title: "Вам начислены баллы!",
                                      message: "Вам начислено 100 баллов за покупку. Вы можете ими воспользоваться при оплате.",
                                      preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Закрыть", style: .default)
        
        alert.addAction(closeAction)
        self.present(alert, animated: false)
    }
}

