//
//  BuyViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Outlets
    var viewModel: LoginViewModel!
    private lazy var loginView = LoginView()
    
    //MARK: - LifeCycle
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Actions
    private func addCallbacks() {
        loginView.onCreateTapped = { [weak self] in
            self?.viewModel.onCreateTapped?()
        }
        
        loginView.onLoginTapped = { [weak self] user in
            let match = self?.viewModel.getDataAndCheckLogin(user.name, "\(user.email)", user.password)
            guard let unwrappedMatch = match else { return }
            if unwrappedMatch {
                print("Name and pass match.")
            }
            else {
                self?.loginView.clearTextFields()
            }
        }
    }
}