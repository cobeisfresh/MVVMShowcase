//
//  AboutViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class AboutViewController: UIViewController {
    lazy var aboutView = AboutView()
    var viewModel: AboutViewModel!
    
    override func loadView() {
        view = aboutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCallbacks()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(test)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func test() {
        viewModel.test()
    }
    
    private func addCallbacks() {
        aboutView.onLogoutTapped = {
            let aboutCoordinator = AboutCoordinator()
            aboutCoordinator.goToLooginVC()
        }
    }
}
