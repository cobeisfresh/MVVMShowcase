//
//  ChangeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation

class ChangeViewModel {
    func saveChangedUserDetails(with user: User) {
        UserDefaults.standard.set(user.name, forKey: "userName")
        UserDefaults.standard.set(user.email, forKey: "userEmail")
        UserDefaults.standard.set(user.password, forKey: "userPass")
    }
    
    func goToHomeVC(with user: User) {
        let homeCoordinator = HomeCoordinator()
        _ = homeCoordinator.homeVC(with: user)
    }
}
