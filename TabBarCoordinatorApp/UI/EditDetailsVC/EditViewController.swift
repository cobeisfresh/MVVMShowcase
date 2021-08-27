//
//  ChangeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class EditViewController: UIViewController {
    lazy var editView = EditView()
    var viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
    
    override func loadView() {
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    
   //MARK: - Outlets
    private func addCallbacks() {
        editView.onSaveDetailsTapped = { [weak self] user in
            self?.viewModel.saveChangedUserDetails(with: user)
            self?.navigationController?.popViewController(animated: true)
        }
        
        editView.onResetPasswordTapped = { [weak self] user in
            self?.viewModel.resetPassword(user.email)
        }
        
        viewModel.onResetPasswordSuccess = { [weak self] email in
            self?.showMessage(title: "Reset password", messagae: "\(email) email received the link for reset password.")
        }

        viewModel.onResetPasswordFailure = { [weak self] in
            self?.showMessage(title: "Reset password", messagae: "Something went wrong.")
        }
    }
}
