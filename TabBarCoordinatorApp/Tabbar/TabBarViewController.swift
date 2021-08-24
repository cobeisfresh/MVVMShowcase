//
//  TabBarViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK: - Outlets
    private lazy var homeVC = HomeViewController()
    private lazy var aboutVC = AboutViewController()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }

    //MARK: - Actions
    func setupTabbar() {
        self.viewControllers = [homeVC,aboutVC]
        self.tabBar.items![0].title = "Home"
        self.tabBar.items![1].title = "About"
    }
}
