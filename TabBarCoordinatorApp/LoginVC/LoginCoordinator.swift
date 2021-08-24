//
//  AuthCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = createLoginVC()
        
        return vc
    }
    
    private func createLoginVC() -> UIViewController {
        let vc = LoginViewController.instance()
        vc.viewModel = LoginViewModel()
        
    //user create
        vc.viewModel.onCreateTapped = { [self] in
            _ = self.showCreateUser()
        }
        
    //user logged in
        vc.viewModel.onLoginTapped = { userDetails in
            let tabbBarCoordinator = TabbarCoordinator()
            _ = tabbBarCoordinator.showTabbarVC(user: User(name: userDetails[0], email: userDetails[1], password: userDetails[2]))
        }
        navigationController.showAsRoot()
        navigationController.pushViewController(vc, animated: false)
        return vc
    }
    
    
    private func showCreateUser() -> UIViewController {
        let vc = CreateUserViewController.instance()
        navigationController.showAsRoot()
        navigationController.pushViewController(vc, animated: false)
        return vc
    }
}
