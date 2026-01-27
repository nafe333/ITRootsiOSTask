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
        
    }
    
       //MARK: - Behaviour
    func tabBarInitialize(){
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
           homeVC.tabBarItem = UITabBarItem(
               title: "Home",
               image: UIImage(systemName: "house"),
               selectedImage: UIImage(systemName: "house.fill")
           )
        let homeNav = UINavigationController(rootViewController: homeVC)
        UITabBar.appearance().tintColor = UIColor(named: "MainColor")
        UITabBar.appearance().unselectedItemTintColor = .gray

        self.viewControllers = [homeNav]
    }
}
