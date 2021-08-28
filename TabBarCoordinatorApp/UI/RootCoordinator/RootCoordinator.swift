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
        var vc = UIViewController()
        
        let userLoggedIn = UserDefaults.standard.bool(forKey: "isLogged")
        UserDefaults.standard.synchronize()
        if !userLoggedIn {
            vc = createAuthVC()
        }
        else {
            vc = createTabbarVC()
        }
        return vc
    }
    
    private func createAuthVC() -> UIViewController {
        let authCoordinator = AuthCoordinator()
        
        authCoordinator.onStartMainCoordinator = { [weak self] user in
            let mainCoordinator = MainCoordintor()
            _ = mainCoordinator.start()
        }
        
        return authCoordinator.start()
    }
    
    private func createTabbarVC() -> UITabBarController {
        let mainCoordinator = MainCoordintor()
        _ = mainCoordinator.start()
        
        return UITabBarController()
    }
}
