//
//  SettingsMenuHelper.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
import UIKit
import MOLH

class SettingsMenuHelper {
    
       //MARK: - Properties
    
    private let defaults = UserDefaults.standard

       //MARK: - Behaviour
    
    static func addSettingsButton(to vc: UIViewController) {
        let logoutAction = UIAction(title: NSLocalizedString("logoutButtonTitle", comment: ""), image: UIImage(systemName: "arrow.backward")) { _ in
            logout(from: vc)
        }
        let languageAction = UIAction(title: NSLocalizedString("changeLanguageButtonTitle", comment: ""), image: UIImage(systemName: "globe")) { _ in
            showLanguageSelection(from: vc)
        }

        let menu = UIMenu(title: "", children: [languageAction, logoutAction])
        let button = UIBarButtonItem(title: "⚙️", menu: menu)
        vc.navigationItem.rightBarButtonItem = button
    }

    private static func showLanguageSelection(from vc: UIViewController) {
        let alert = UIAlertController(
            title: NSLocalizedString("changeLanguageButtonTitle", comment: ""),
            message: nil,
            preferredStyle: .actionSheet
        )

        alert.addAction(UIAlertAction(title: NSLocalizedString("englishLanguage", comment: ""), style: .default) { _ in
            changeLanguage(to: "en")
        })

        alert.addAction(UIAlertAction(title: NSLocalizedString("arabicLanguage", comment: ""), style: .default) { _ in
            changeLanguage(to: "ar")
        })

        alert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel))
        vc.present(alert, animated: true)
    }

    private static func changeLanguage(to language: String) {
        MOLH.setLanguageTo(language)
        MOLH.reset()
    }
    
    private static func logout(from vc: UIViewController) {
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isLoggedIn)
        UserDefaults.standard.synchronize()

        let onboardingVC = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: onboardingVC)

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.rootViewController = nav
            window.makeKeyAndVisible()
        }
    }

}
