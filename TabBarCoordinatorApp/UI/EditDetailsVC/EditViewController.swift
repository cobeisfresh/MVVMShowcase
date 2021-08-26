//
//  ChangeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class EditViewController: UIViewController {
    lazy var changeView = EditView()
    var viewModel = EditViewModel()
    
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
    }
    
    private func reCallHomeCoordinator(user: User) {
        let homeCoo = HomeCoordinator()
        _ = homeCoo.start()
        viewModel.saveChangedUserDetails(with: user)
    }
}
