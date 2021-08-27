//
//  ChangeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class EditViewController: UIViewController {
    lazy var changeView = EditView()
    var viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
    
    override func loadView() {
        view = changeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
   //MARK: - Outlets
    private func addCallbacks() {
        changeView.onSaveDetailsTapped = { [weak self] user in
            self?.reCallHomeCoordinator(user: user)
        }
        
        changeView.onResetPasswordTapped = { [weak self] user in
            self?.viewModel.resetPassword(user.email)
        }
        
        changeView.onSaveDetailsTapped = { [weak self] user in
            self?.reCallHomeCoordinator(user: user)
        }
        
//        viewModel.onResetPasswordSuccess = { [weak self] email in
//            self?.showMessage(title: "Success", messagae: "\(email) email received the link for reset password.")
//        }
//
//        viewModel.onResetPasswordFailure = { [weak self] in
//            self?.showMessage(title: "", messagae: "Something went wrong.")
//        }
    }
    
    private func reCallHomeCoordinator(user: User) {
        let homeCoo = HomeCoordinator()
        _ = homeCoo.start()
        viewModel.saveChangedUserDetails(with: user)
    }
}
