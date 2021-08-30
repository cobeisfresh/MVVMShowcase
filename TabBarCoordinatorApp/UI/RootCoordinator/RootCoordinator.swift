//
//  MainCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class RootCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    let navigationConttroller = UINavigationController()
    
    func start() -> UIViewController {
        let vc: UIViewController
        
        let userLoggedIn = UserDefaults.standard.bool(forKey: "isLogged")
        UserDefaults.standard.synchronize()
        if !userLoggedIn {
            vc = createAuthVC()
        }
        else {
            vc = createTabbarVC(user: nil) // TODO get user from usee defaults
        }
        return vc
    }
    
    private func createAuthVC() -> UIViewController {
        let authCoordinator = AuthCoordinator()
        
        authCoordinator.onStartMainCoordinator = { [weak self] user in
            _ = self?.createTabbarVC(user: user)
        }
        childCoordinator = authCoordinator
        return authCoordinator.start()
    }
    
    private func createTabbarVC(user: User? ) -> UITabBarController {
        let mainCoordinator = MainCoordinator(user: user)
        mainCoordinator.onLogout = { [weak self] in
            _ = self?.createAuthVC()
        }
        childCoordinator = mainCoordinator
        _ = mainCoordinator.start()
        
        return UITabBarController()
    }
}
