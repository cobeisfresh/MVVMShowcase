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
    
    var onStartMainCoordinator: ((User) -> Void)?
    
    func start() -> UIViewController {
        let vc = createLoginVC()
        navigationController.showAsRoot()
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }
    
    private func createLoginVC() -> UIViewController {
        let vc = LoginViewController()
        vc.viewModel = LoginViewModel(authenticationService: ServiceFactory.authenticationService)

        vc.viewModel.onCreateTapped = { [weak self] in
            _ = self?.createUserCreateVC()
        }
        vc.viewModel.onAuthSuccess = { [weak self] user in
            UserDefaults.standard.set(true, forKey: "isLogged")
            UserDefaults.standard.synchronize()
            self?.onStartMainCoordinator?(user)
        }
        vc.viewModel.onAuthFailure = { [weak vc] in
            vc?.viewModel.onShowMessage?()
        }
        
        return vc
    }
    
    private func createUserCreateVC() -> UIViewController {
        let vc = CreateUserViewController()
        vc.viewModel = CreateUserViewModel(authenticationService: ServiceFactory.authenticationService)
        
        vc.viewModel.onGoToLogin = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}
