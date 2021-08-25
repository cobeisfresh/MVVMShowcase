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
    
    func start() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        vc.viewModel.onSetupUserDetails?()
        return vc
    }
}
