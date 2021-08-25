//
//  AuthCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 25.08.2021..
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = LoginViewController()
        vc.viewModel = LoginViewModel()
        navigationController.showAsRoot()
        
        return createLoginVC()
    }
    
    private func createLoginVC() -> UIViewController {
        let vc = LoginViewController()
        vc.viewModel = LoginViewModel()

        vc.viewModel.onCreateTapped = {
            _ = self.createUserCreateVC()
        }
        vc.viewModel.onAuthSuccess = { user in
            let mainCoordinator = MainCoordintor(user: user)
            _ = mainCoordinator.start()
        }
        vc.viewModel.onAuthFailure = { [weak self] in
            print("AUTH FAILED")
            vc.viewModel.onShowMessage?()
        }
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
    private func createUserCreateVC() -> UIViewController {
        let vc = CreateUserViewController()
        vc.viewModel = CreateUserViewModel()
        
        vc.viewModel.onGoToLogin = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}
