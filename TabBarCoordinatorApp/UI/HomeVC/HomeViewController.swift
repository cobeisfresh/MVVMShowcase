//
//  HomeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class HomeViewController: UIViewController {
    lazy var homeView = HomeView()
    var viewModel = HomeViewModel()
    
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
    }
    
    private func addCallBacks() {
        homeView.onChangeTapped = { [weak self] user in
            self?.reCallHomeCoordinator(user: user)
        }
    }
    
    private func reCallHomeCoordinator(user: User) {
        let homeCoo = HomeCoordinator()
        _ = homeCoo.start()
        homeCoo.onChangeDetailsTapped?(user)
    }
}
