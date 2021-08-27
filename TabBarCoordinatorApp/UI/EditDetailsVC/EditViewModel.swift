//
//  ChangeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation

class EditViewModel {
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    var onResetPasswordSuccess: ((String) -> Void)?
    var onResetPasswordFailure: (() -> Void)?
    
    func resetPassword(_ email: String) {
        authenticationService.resetPassword(email: email)
    }
    
    func saveChangedUserDetails(with user: User) {
        UserDefaults.standard.set(user.phone, forKey: "userPhone")
        UserDefaults.standard.set(user.address, forKey: "userAddress")
        UserDefaults.standard.set(user.country, forKey: "userCountry")
    }
}
