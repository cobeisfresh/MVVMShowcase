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
        let vc = ChangeViewController()
        vc.viewModel = ChangeViewModel()
        vc.changeView.setupUserDetails(with: user)
        
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}
