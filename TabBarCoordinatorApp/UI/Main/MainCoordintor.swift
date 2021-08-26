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
    
    static var tabBarController: UITabBarController!
    enum TBCoordinator: Int {
        case home
        case about
    }
    
    private var childCoordinators: [Coordinator] = [
        HomeCoordinator(),
        AboutCoordinator()
    ]
    
    private func createTabBar() {
        MainCoordintor.tabBarController = UITabBarController()
        MainCoordintor.tabBarController.viewControllers = childCoordinators.map { coordinator in
            let vc = coordinator.start()
            vc.tabBarItem = coordinator.TBCoordinator.tabBarItem
            return vc
        }
    }
    
    private func startTabBar(user: User) -> UITabBarController {
        createTabBar()
        MainCoordintor.tabBarController.showAsRoot()
        setupTabBarViewsWithDetails(user: user)
        return MainCoordintor.tabBarController
    }
    
    private func setupTabBarViewsWithDetails(user: User) {
        let homeVC = MainCoordintor.tabBarController.viewControllers![0] as! HomeViewController
        homeVC.viewModel = HomeViewModel()
        homeVC.homeView.setupUserDetails(name: user.name, email: user.email, pass: user.password)
        
        let aboutVC = MainCoordintor.tabBarController.viewControllers![1] as! AboutViewController
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
