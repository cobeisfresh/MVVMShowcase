//
//  CreateUserViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class CreateUserViewController: UIViewController {
    private lazy var createUserView = CreateUserView()
    var createUserViewModel = CreateUserViewModel()
    
    //MARK: - LifeCycle
    override func loadView() {
        view = createUserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    //MARK: - Actions
    private func addCallbacks() {
        createUserView.onCreateUser = { [weak self] user in
            self?.createUserViewModel.saveUser(user)
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
