//
//  SceneDelegate.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit
import MOLH

class SceneDelegate: UIResponder, UIWindowSceneDelegate, MOLHResetable {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        MOLH.shared.activate(true)
        window = UIWindow(windowScene: windowScene)
        resetRoot()

        window?.makeKeyAndVisible()
    }

    func reset() {
        resetRoot()
    }

    func resetRoot() {
        let isLoggedIn = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn)

        if isLoggedIn {
            window?.rootViewController = HomeTabBarViewController()
        } else {
            let onboardingVC = OnboardingViewController(
                nibName: "OnboardingViewController",
                bundle: nil
            )
            window?.rootViewController = UINavigationController(rootViewController: onboardingVC)
        }
    }


}

