//
//  AlertManager.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import Foundation
import UIKit

class AlertManager {
    
       //MARK: - Behaviour
    func showAlert(on viewController: UIViewController,
                     title: String,
                   message: String) {
        let alert = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
}
