//
//  ChangeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation
import Firebase

class EditViewModel {
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    var onResetPasswordSuccess: ((String) -> Void)?
    var onResetPasswordFailure: (() -> Void)?
    var onShouldShowHome: ((User) -> Void)?
    
    func resetPassword(_ email: String) {
        authenticationService.resetPassword(email: email, completion: { (result) in
            switch result {
            case .success:
                self.onResetPasswordSuccess?(email)
            case .failure:
                self.onResetPasswordFailure?()
            }
        })
    }
    
    func getCurrentUser() -> String {
        var userEmail = String()
        authenticationService.getCurrentUser { email in
            userEmail = email
        }
        return userEmail
    }
    
    func saveChangedUserDetails(phone: Int, address: String, country: String) {
        let email = getCurrentUser()
        UserDefaults.standard.set(phone, forKey: "userPhone_\(email)")
        UserDefaults.standard.set(address, forKey: "userAddress_\(email)")
        UserDefaults.standard.set(country, forKey: "userCountry_\(email)")
        UserDefaults.standard.synchronize()
    }
}
