//
//  TabbarCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class MainCoordintor: Coordinator {
    let user: User
    let navigationController = UINavigationController()
    
    init(user: User) {
        self.user = user
    }
    
    func start() -> UIViewController {
        return startTabBar(user: user)
    }
    
    var tabBarController = UITabBarController()
    enum TBCoordinator: Int {
        case home
        case about
    }
    
    private var childCoordinators: [Coordinator] = [
        HomeCoordinator(),
        AboutCoordinator()
    ]
    
    private func createTabBar() {
        tabBarController = UITabBarController()
        tabBarController.viewControllers = childCoordinators.map { coordinator in
            let vc = coordinator.start()
            vc.tabBarItem = coordinator.TBCoordinator.tabBarItem
            return vc
        }
    }
    
    private func startTabBar(user: User) -> UITabBarController {
        createTabBar()
        tabBarController.showAsRoot()
//        setupTabBarViewsWithDetails(user: user)
        return tabBarController
    }
    
    private func setupTabBarViewsWithDetails(user: User) {
        let navigationControllers = tabBarController.viewControllers
       
        let homeVC = tabBarController.viewControllers?[0].children[0].contentViewController as! HomeViewController
        homeVC.viewModel = HomeViewModel()
        homeVC.homeView.setupUserDetails(user: user)
        
        let aboutVC = tabBarController.viewControllers?[1].children[0].contentViewController as! AboutViewController
        aboutVC.viewModel = AboutViewModel()
        aboutVC.aboutView.setupUserDetails(with: user)
    }
}

extension Coordinator {
    var TBCoordinator: MainCoordintor.TBCoordinator {
        switch self {
        case is HomeCoordinator:
            return .home
        case is AboutCoordinator:
            return .about
        default:
            fatalError("No tab bar set for this coordinator!:\(self)")
        }
    }
}

extension MainCoordintor.TBCoordinator {
    var tabBarItem: UITabBarItem {
        let tabBarItem: UITabBarItem
        switch  self {
        case .home:
            tabBarItem = createItem(title: "HOME", selectedImageName: "", unselectedImageName: "")
            
        case .about:
            tabBarItem = createItem(title: "ABOUT", selectedImageName: "", unselectedImageName: "")
        }
        tabBarItem.tag = self.rawValue
        return tabBarItem
    }
    
    private func createItem(title: String, selectedImageName: String, unselectedImageName: String) -> UITabBarItem {
        let selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        let unselectedImage =  UIImage(named: unselectedImageName)?.withRenderingMode(.automatic)
        return UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
    }
}
