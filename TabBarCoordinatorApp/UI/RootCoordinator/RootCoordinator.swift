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
        let vc = createAuthVC()
        
        return vc
    }
    
    private func createAuthVC() -> UIViewController {
        let authCoordinator = AuthCoordinator()
        
        authCoordinator.onStartMainCoordinator = { [weak self] user in
            let mainCoordinator = MainCoordintor(user: user)
            _ = mainCoordinator.start()
        }
        
        return authCoordinator.start()
    }
}
