//
//  CreateUserViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation

final class CreateUserViewModel {
    // MARK: - Properties
    var onGoToLogin: EmptyCallback?
    
    func saveUser(_ user: User) {
        UserDefaults.standard.set(user.name, forKey: "userName")
        UserDefaults.standard.set(user.email, forKey: "userEmail")
        UserDefaults.standard.set(user.password, forKey: "userPass")
    }
}

// MARK: - Navigation
extension CreateUserViewModel {
    func goToLogin() {
        onGoToLogin?()
    }
}
