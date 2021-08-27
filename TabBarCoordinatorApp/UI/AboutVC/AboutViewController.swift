//
//  AboutViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class AboutViewController: UIViewController {
    lazy var aboutView = AboutView()
    var viewModel = AboutViewModel()
    
    override func loadView() {
        view = aboutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func addCallbacks() {
        aboutView.onLogoutTapped = { [weak self] in
            self?.viewModel.onLogoutButtonTapped?()
        }
    }
}
