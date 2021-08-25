//
//  MainCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

final class RootCoordinator: Coordinator {
    func start() -> UIViewController {
        let vc = showLoginFlow()
        return vc
    }
}

// MARK: - Private Methods
private extension RootCoordinator {
    func showLoginFlow() -> UIViewController {
        let loginCoordinator = LoginCoordinator()
        return loginCoordinator.start()
    }
    
    func showMainFlow() {
        let tabbarCoordinator = TabbarCoordinator()
        _ = tabbarCoordinator.start()
    }    
}
