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
}
