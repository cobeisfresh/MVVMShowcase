//
//  HomeCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = HomeViewController()
        return vc
    }
}

extension HomeCoordinator {
    func homeVC(with user: User) -> UIViewController {
        let vc = TabBarViewController()
        let homeVC = vc.viewControllers?[0] as! HomeViewController
        homeVC.homeView.setupUserDetails(name: user.name, email: user.email, pass: user.password)
        
        self.navigationController.showAsRoot()
        self.navigationController.pushViewController(vc, animated: true)
        
        return vc
    }
    
    func changeUserDetailsVC(with user: User) -> UIViewController {
        let vc = ChangeViewController()
        vc.changeView.setupUserDetails(with: user)
        
        self.navigationController.showAsRoot()
        self.navigationController.pushViewController(vc, animated: true)

        return vc
    }
}
