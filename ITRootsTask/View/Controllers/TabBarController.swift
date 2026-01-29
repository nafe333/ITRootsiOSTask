//
//  TabBarController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {
    
       //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarInitialize()
    }
    
       //MARK: - Behaviour
    func tabBarInitialize() {

        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeVC.tabBarItem = UITabBarItem(
            title: NSLocalizedString("homeTabBarTitle", comment: ""),
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        let homeNav = UINavigationController(rootViewController: homeVC)

        let postsVC = PostsViewController(nibName: "PostsViewController", bundle: nil)
        postsVC.tabBarItem = UITabBarItem(
            title: NSLocalizedString("postsTabBarTitle", comment: ""),
            image: UIImage(systemName: "person.2.wave.2"),
            selectedImage: UIImage(systemName: "person.2.wave.2.fill")
        )
        let postsNav = UINavigationController(rootViewController: postsVC)

        UITabBar.appearance().tintColor = UIColor(named: "MainColor")
        UITabBar.appearance().unselectedItemTintColor = .gray

        self.viewControllers = [homeNav, postsNav]
    }
}
