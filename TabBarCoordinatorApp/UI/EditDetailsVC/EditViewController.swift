//
//  ChangeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit
import Firebase

class EditViewController: UIViewController {
    lazy var editView = EditView()
    var viewModel = EditViewModel(authenticationService: ServiceFactory.authenticationService)
    
    override func loadView() {
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
        refreshView()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    
   //MARK: - Outlets
    private func addCallbacks() {
        editView.onSaveDetailsTapped = { [weak self] user in
            self?.viewModel.saveChangedUserDetails(phone: user.phone ?? 000 , address: user.address ?? "", country: user.country ?? "")
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
    
    private func refreshView() {
        let userEmail = viewModel.getCurrentUser()
        let userName = UserDefaults.standard.string(forKey: "userName_\(userEmail)") ?? ""
        let userPassword = UserDefaults.standard.string(forKey: "userPassword_\(userEmail)") ?? ""
        let phone = UserDefaults.standard.string(forKey: "userPhone_\(userEmail )") ?? "000"
        let address = UserDefaults.standard.string(forKey: "userAddress_\(userEmail )")
        let country = UserDefaults.standard.string(forKey: "userCountry_\(userEmail )")
        
        let user = User(name: userName, email: userEmail, password: userPassword, phone: Int(phone), address: address, country: country)
        editView.setupUserDetails(with: user)
    }
}
