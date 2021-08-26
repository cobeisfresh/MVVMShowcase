//
//  AboutCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class AboutCoordinator: Coordinator {
    func start() -> UIViewController {
        let vc = AboutViewController()
        vc.viewModel = AboutViewModel()
        return vc
    }
    
    func goToLooginVC() {
        let rootCoordinator = RootCoordinator()
        let loginVC = LoginViewController()
        loginVC.viewModel = LoginViewModel(authenticationService: ServiceFactory.authenticationService)
        _ = rootCoordinator.start()
    }
}
