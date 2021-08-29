//
//  AboutCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class AboutCoordinator: Coordinator {
    var onLogout: (() -> Void)?
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = createAboutVC()
        
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
    
    private func createAboutVC() -> UIViewController {
        let vc = AboutViewController()
        vc.viewModel = AboutViewModel()
        
        vc.viewModel.onLogoutButtonTapped = { [weak vc] in
            vc?.viewModel.onStartActivity?()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak vc] in
                UserDefaults.standard.set(false, forKey: "isLogged")
                UserDefaults.standard.synchronize()
                vc?.viewModel.onEndActivity?()
                //self.goToLooginVC()
                self.onLogout?()
            }
        }
        
        return vc
    }
    
//    private func goToLooginVC() {
//        let root = RootCoordinator()
//        let loginVC = LoginViewController()
//        loginVC.viewModel = LoginViewModel(authenticationService: ServiceFactory.authenticationService)
//        _ = root.start()
//    }
}
