//
//  EditCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 27.08.2021..
//

import Foundation
import UIKit

class EditCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var onSaveTapped: ((User) -> Void)?
    
    func start() -> UIViewController {
        let vc = createEditVC()
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }
    
    private func createEditVC() -> UIViewController {
        let vc = EditViewController()
        vc.viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
        
        vc.viewModel.onShouldShowHome = { [weak self] user in
            self?.navigationController.popViewController(animated: true)
        }
        
        return vc
    }
}
