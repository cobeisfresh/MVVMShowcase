//
//  CreateUserViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class CreateUserViewController: UIViewController {
    private lazy var createUserView = CreateUserView()
    var viewModel: CreateUserViewModel!
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        indicator.center = view.center
        return indicator
    }()
    
    func startLoader() {
        activityIndicator.startAnimating()
    }
    
    func stopLoader() {
        activityIndicator.stopAnimating()
    }
    
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
            self?.viewModel.register(user)
        }
        
        createUserView.onEmptyField = { [weak self] in
            self?.showMessage(title: "Error", messagae: "Please fill all fields.")
        }
        
        createUserView.onPasswordError = { [weak self] in
            self?.showMessage(title: "Error", messagae: "Password needs to be at least 6 characters")
        }
        
        viewModel.onStartedActivity = { [weak self] in
            self?.startLoader()
        }
        
        viewModel.onEndedActivity = { [weak self] in
            self?.stopLoader()
        }
        
        viewModel.onError = { [weak self] in
            self?.showMessage(title: "Error", messagae: "Error creating account, try again.")
        }
    }
}
