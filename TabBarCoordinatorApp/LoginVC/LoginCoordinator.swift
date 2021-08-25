//
//  AuthCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class LoginCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = createLoginVC()
        return vc
    }
}

// MARK: - Private Methods
private extension LoginCoordinator {
    func createLoginVC() -> UIViewController {
        let vc = LoginViewController()
        vc.viewModel = LoginViewModel()
        
        vc.viewModel.onCreateTapped = {
            _ = self.showCreateUser()
        }
        
        vc.viewModel.onLoginTapped = { userDetails in
            let tabbBarCoordinator = TabbarCoordinator()
            _ = tabbBarCoordinator.showTabbarVC(user: User(name: userDetails[0], email: userDetails[1], password: userDetails[2]))
        }
        
        navigationController.showAsRoot()
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
    func showCreateUser() -> UIViewController {
        let vc = CreateUserViewController()
        let vm = CreateUserViewModel()
        vc.viewModel = vm
        
        vm.onGoToLogin = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        
        navigationController.showAsRoot()
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}
