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
        let vc = createAboutVC()
        
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
    
    private func createAboutVC() -> UIViewController {
        let vc = AboutViewController()
        vc.viewModel = AboutViewModel()
        
        vc.viewModel.onLogoutButtonTapped = {
            self.goToLooginVC()
        }
        
        return vc
    }
    
    private func goToLooginVC() {
        let authCoordinator = AuthCoordinator()
        authCoordinator.navigationController.showAsRoot()
        let loginVC = LoginViewController()
        loginVC.viewModel = LoginViewModel(authenticationService: ServiceFactory.authenticationService)
        _ = authCoordinator.start()
    }
}
