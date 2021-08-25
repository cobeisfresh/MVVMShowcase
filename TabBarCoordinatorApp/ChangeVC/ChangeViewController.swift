//
//  ChangeViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import UIKit

class ChangeViewController: UIViewController {
    lazy var changeView = ChangeView()
    var changeViewModel = ChangeViewModel()
    
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
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction))
        
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backAction() {
        let name = UserDefaults.standard.string(forKey: "userName")
        let email = UserDefaults.standard.string(forKey: "userEmail")
        let pass = UserDefaults.standard.string(forKey: "userPass")
        if name != nil && email != nil && pass != nil {
            let user = User(name: name!, email: email!, password: pass!)
            gotoHomeVC(user: user)
        }
        
        
    }
    
    
   //MARK: - Outlets
    private func addCallbacks() {
        changeView.onSaveDetailsTapped = { [weak self] user in
            self?.changeViewModel.saveChangedUserDetails(with: user)
            self?.gotoHomeVC(user: user)
        }
    }
    
    private func gotoHomeVC(user: User) {
        let homeCoordinator = HomeCoordinator()
    }

}
