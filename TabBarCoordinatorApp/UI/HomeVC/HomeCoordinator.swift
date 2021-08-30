//
//  HomeCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit
import Firebase

final class HomeCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var onChangeDetailsTapped: ((User) -> Void)?
    var onSaveTapped: ((User) -> Void)?
    
    func start() -> UIViewController {
        let vc = createHomeVC()
        
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        
        if let userEmail = Auth.auth().currentUser?.email {
            if let data = UserDefaults.standard.data(forKey: "user_\(userEmail)") {
                do {
                    let decoder = JSONDecoder()
                    let decodedUser = try decoder.decode(User.self, from: data)
                    let user = User(name: decodedUser.name, email: decodedUser.email, password: decodedUser.password, phone: Int(""), address: "", country: "")
                    vc.homeView.setupUserDetails(user: user)
                } catch {
                    print("Unable to Decode Note (\(error))")
                }
            }
        }
        
        vc.viewModel.onChangeDetailsTapped = { [weak self] user in
            vc.viewModel.onShouldShowEditVC?(user)
        }
        
        return vc
    }
}
