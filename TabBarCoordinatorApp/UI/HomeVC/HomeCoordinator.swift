//
//  HomeCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit
import Firebase

final class HomeCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var onChangeDetailsTapped: ((User) -> Void)?
    var onSaveTapped: ((User) -> Void)?
    
    func start() -> UIViewController {
        let vc = createHomeVC()
        
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        
        if let userEmail = Auth.auth().currentUser?.email {
            let userName = UserDefaults.standard.string(forKey: "userName_\(userEmail)") ?? ""
            let userPassword = UserDefaults.standard.string(forKey: "userPassword_\(userEmail)") ?? ""
            
            let user = User(name: userName, email: userEmail, password: userPassword, phone: Int(""), address: "", country: "")
            vc.homeView.setupUserDetails(user: user)
        }
        
        vc.viewModel.onChangeDetailsTapped = { [weak self] user in
            vc.viewModel.onShouldShowEditVC?(user)
        }

        return vc
    }
    
//    private func createChangeDetailsVC(user: User) -> UIViewController {
//        let vc = EditViewController()
//        vc.viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
//        vc.editView.setupUserDetails(with: user)
//
//        onSaveTapped = { [weak self] user in
//            vc.viewModel.saveChangedUserDetails(with: user)
//
//            let homeVC = HomeViewController()
//            homeVC.viewModel = HomeViewModel()
//            homeVC.homeView.setupUserDetails(name: user.name, email: user.email, pass: user.password)
//        }
//
//        navigationController.pushViewController(vc, animated: true)
//        return vc
//    }
}
