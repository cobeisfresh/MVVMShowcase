//
//  HomeCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var onChangeDetailsTapped: ((User) -> Void)?
    var onSaveTapped: ((User) -> Void)?
    
    func start() -> UIViewController {
        navigationController.showAsRoot()
        return createHomeVC()
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        
        onChangeDetailsTapped = { [weak self] user in
            _ = self?.createChangeDetailsVC(user: user)
        }
        
        let tabbarController = MainCoordintor.tabBarController!
        navigationController.pushViewController(tabbarController, animated: true)
        
        return vc
    }
    
    private func createChangeDetailsVC(user: User) -> UIViewController {
        let vc = EditViewController()
        vc.viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
        vc.changeView.setupUserDetails(with: user)
        
        onSaveTapped = { [weak self] user in
            vc.viewModel.saveChangedUserDetails(with: user)
            
            let homeVC = HomeViewController()
            homeVC.viewModel = HomeViewModel()
            homeVC.homeView.setupUserDetails(name: user.name, email: user.email, pass: user.password)
        }
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}
