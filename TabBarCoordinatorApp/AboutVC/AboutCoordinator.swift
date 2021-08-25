//
//  AboutCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class AboutCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = logout()
        return vc
    }
}

extension AboutCoordinator {
    func logout() -> UIViewController {
        let vc = LoginViewController.instance()
        vc.showAsRoot()
        
        self.navigationController.showAsRoot()
        self.navigationController.viewControllers.removeAll()
            let loginCoordinator = LoginCoordinator()
        
        _ = loginCoordinator.start()
        return vc
    }
}
