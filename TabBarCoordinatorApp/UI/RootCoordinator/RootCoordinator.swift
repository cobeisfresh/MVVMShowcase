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
    
    func start() -> UIViewController {
        let authCoordinator = AuthCoordinator()
        let vc = createAuthVC()
        childCoordinator = authCoordinator
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
