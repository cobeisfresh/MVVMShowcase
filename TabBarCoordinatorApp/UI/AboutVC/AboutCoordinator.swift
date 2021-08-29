//
//  AboutCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit
import Firebase

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
        
        if let userEmail = Auth.auth().currentUser?.email {
            let userName = UserDefaults.standard.string(forKey: "userName_\(userEmail)") ?? ""
            let userPassword = UserDefaults.standard.string(forKey: "userPassword_\(userEmail)") ?? ""
            
            let user = User(name: userName, email: userEmail, password: userPassword, phone: Int(""), address: "", country: "")
            vc.aboutView.setupUserDetails(with: user)
        }
        
        vc.viewModel.onLogoutButtonTapped = {
            vc.viewModel.onStartActivity?()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                UserDefaults.standard.set(false, forKey: "isLogged")
                UserDefaults.standard.synchronize()
                vc.viewModel.onEndActivity?()
                self.goToLooginVC()
            }
        }
        
        return vc
    }
    
    private func goToLooginVC() {
        let root = RootCoordinator()
        let loginVC = LoginViewController()
        loginVC.viewModel = LoginViewModel(authenticationService: ServiceFactory.authenticationService)
        _ = root.start()
    }
}
