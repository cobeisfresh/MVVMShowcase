//
//  AboutViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit
import Firebase

class AboutViewController: UIViewController {
    lazy var aboutView = AboutView()
    var viewModel: AboutViewModel!
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
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
    
    override func loadView() {
        view = aboutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
        refreshView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func addCallbacks() {
        aboutView.onLogoutTapped = { [weak self] in
            self?.viewModel.onLogoutButtonTapped?()
        }
        
        viewModel.onStartActivity = { [weak self] in
            self?.activityIndicator.startAnimating()
        }
        
        viewModel.onEndActivity = { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    private func refreshView() {
        guard let userEmail = Auth.auth().currentUser?.email else { return }
        let userName = UserDefaults.standard.string(forKey: "userName_\(userEmail)") ?? ""
        let userPassword = UserDefaults.standard.string(forKey: "userPassword_\(userEmail)") ?? ""
        let phone = UserDefaults.standard.string(forKey: "userPhone_\(userEmail )") ?? "000"
        let address = UserDefaults.standard.string(forKey: "userAddress_\(userEmail )")
        let country = UserDefaults.standard.string(forKey: "userCountry_\(userEmail )")
        
        let user = User(name: userName, email: userEmail, password: userPassword, phone: Int(phone), address: address, country: country)
        aboutView.setupUserDetails(with: user)
    }
}
