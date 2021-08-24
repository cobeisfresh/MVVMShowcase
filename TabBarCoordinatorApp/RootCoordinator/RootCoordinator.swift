//
//  MainCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class RootCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var childCoordinators: [Coordinator] = [LoginCoordinator(), TabbarCoordinator()]
    
    func start() -> UIViewController {
        let vc = showLoginFlow()
        
        return vc
    }
    
    func showLoginFlow() -> UIViewController {
        let loginCoordinator = childCoordinators[0]
        _ = loginCoordinator.start()
        
        return UIViewController()
    }
    
    func showMainFlow() {
        let tabbarCoordinator = childCoordinators[1]
        _ = tabbarCoordinator.start()
    }    
}


