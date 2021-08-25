//
//  TabbarCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class TabbarCoordinator: Coordinator {
    let user: User
    let navigationController = UINavigationController()
    
    // MARK: - Init
    init(user: User) {
        self.user = user
    }
    
    func start() -> UIViewController {
        return showTabbarVC(user: user)
    }
}

// MARK: - Private methods
private extension TabbarCoordinator {
    func showTabbarVC(user: User) -> UIViewController {
        let vc = TabBarViewController()
        
        let navController = vc.viewControllers![0]
        let homeVC = navController as! HomeViewController
        homeVC.homeView.setupUserDetails(name: user.name, email: user.email, pass: user.password )
        
        let navController1 = vc.viewControllers![1]
        let aboutVC = navController1 as! AboutViewController
        aboutVC.aboutView.setupUserDetails(with: user)
        
        navigationController.showAsRoot()
        navigationController.pushViewController(vc, animated: false)
        
        return vc
    }
    
    func refreshAboutVC(user: User) {
        let vc = TabBarViewController()
        let navController1 = vc.viewControllers![1]
        let aboutVC = navController1 as! AboutViewController
        aboutVC.aboutView.setupUserDetails(with: user)
    }
}
