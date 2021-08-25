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
        return authCoordinator.start()
    }
}
