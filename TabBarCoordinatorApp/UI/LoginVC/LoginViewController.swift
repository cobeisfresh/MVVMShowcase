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
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .white
        self.view.addSubview(indicator)
        indicator.center = view.center
        return indicator
    }()
    
    var registeredUser = String()
    
    func startLoader() {
        activityIndicator.startAnimating()
    }
    
    func stopLoader() {
        activityIndicator.stopAnimating()
    }
    
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
        loginView.setupView(email: registeredUser)
    }
    
    //MARK: - Actions
    private func addCallbacks() {
        loginView.onCreateTapped = { [weak self] in
            self?.viewModel.onCreateTapped?()
        }
        
        loginView.onLoginTapped = { [weak self] user in
            self?.viewModel.login(user.name, user.email, user.password)
        }
        
        viewModel.onShowMessage = { [weak self] in
            self?.showMessage(title: "Auth failed", messagae: "Wrong name or password")
        }
        
        viewModel.onStartedActivity = { [weak self] in
            self?.startLoader()
        }
        
        viewModel.onEndedActivity = { [weak self] in
            self?.stopLoader()
        }
    }
}
