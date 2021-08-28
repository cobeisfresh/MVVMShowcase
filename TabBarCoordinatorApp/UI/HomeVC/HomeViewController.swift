//
//  HomeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    lazy var homeView = HomeView()
    var viewModel: HomeViewModel!
    let authenticationService = ServiceFactory.authenticationService
    
    
    var name = "a"
    var email = "b"
    var pass = "c"
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallBacks()
        refreshView()
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
    
    private func refreshView() {
        let userName = UserDefaults.standard.string(forKey: "userName")
        let userEmail = Auth.auth().currentUser?.email
        let userPassword = UserDefaults.standard.string(forKey: "userPassword")
        if let name = userName, let email = userEmail, let password = userPassword {
            let user = User(name: name, email: email, password: password, phone: Int(""), address: "", country: "")
            homeView.setupUserDetails(user: user)
            
        }
    }
}
