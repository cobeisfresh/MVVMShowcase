//
//  CreateUserViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class CreateUserViewController: UIViewController {
    private lazy var createUserView = CreateUserView()
    var viewModel = CreateUserViewModel()
    
    //MARK: - LifeCycle
    override func loadView() {
        view = createUserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Actions
    private func addCallbacks() {
        createUserView.onCreateUser = { [weak self] user in
            self?.viewModel.saveUser(user)
            self?.viewModel.goToLogin()
        }
    }
}
