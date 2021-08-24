//
//  AboutCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class AboutCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = logOut()

        return vc
    }
    
    func logOut() -> UIViewController {
        let vc = LoginViewController.instance()
        
        vc.showAsRoot()
        navigationController.showAsRoot()
        navigationController.viewControllers.removeAll()
            let loginCoordinator = LoginCoordinator()
        _ = loginCoordinator.start()
        
        return vc
    }
    
    
}
