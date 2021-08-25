//
//  AboutViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class AboutViewController: UIViewController {
    lazy var aboutView = AboutView()
    var aboutViewModel = AboutViewModel()
    
    override func loadView() {
        view = aboutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    private func addCallbacks() {
        aboutView.onLogoutTapped = { [weak self] in
            self?.aboutViewModel.logout()
            self?.goToLoginVC()
        }
    }
    
    private func goToLoginVC() {
        let aboutCcoordinator = AboutCoordinator()
        _ = aboutCcoordinator.logout()
    }
}
