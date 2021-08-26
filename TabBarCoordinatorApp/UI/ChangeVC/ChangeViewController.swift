//
//  ChangeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class ChangeViewController: UIViewController {
    lazy var changeView = ChangeView()
    var viewModel = ChangeViewModel()
    
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
            self?.viewModel.saveChangedUserDetails(with: user)
            self?.gotoHomeVC(user: user)
        }
    }
    
    private func gotoHomeVC(user: User) {
        let homeCoordinator = HomeCoordinator()
    }

}
