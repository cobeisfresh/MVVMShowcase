//
//  HomeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class HomeViewController: UIViewController {
    lazy var homeView = HomeView()
    var viewModel: HomeViewModel!
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallBacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    private func addCallBacks() {
        homeView.onChangeTapped = { [weak self] user in
            self?.viewModel.onChangeDetailsTapped?(user)
        }
        
        viewModel.onShouldShowEditVC = { user in
            let editVC = EditViewController()
            editVC.viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
            editVC.editView.setupUserDetails(with: user)
            self.navigationController?.pushViewController(editVC, animated: true)
        }
    }
}
