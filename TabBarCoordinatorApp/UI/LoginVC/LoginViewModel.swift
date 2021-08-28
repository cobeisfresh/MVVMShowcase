//
//  LoginViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class LoginViewModel {
    var user: User?    
    var onCreateTapped: (() -> Void)?
    var onAuthSuccess: ((User) -> Void)?
    var onAuthFailure: (() -> Void)?
    var onShowMessage: (() -> Void)?
    var onStartedActivity: (() -> Void)?
    var onEndedActivity: (() -> Void)?
    
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func login(_ name: String, _ email: String, _ password: String) {
        let userName = UserDefaults.standard.string(forKey: "userName_\(email)") ?? ""
        let phone = UserDefaults.standard.string(forKey: "userPhone_\(email)") ?? "000"
        let address = UserDefaults.standard.string(forKey: "userAddress_\(email)")
        let country = UserDefaults.standard.string(forKey: "userCountry_\(email)")
        UserDefaults.standard.set(password, forKey: "userPassword_\(email)")
        let user = User(name: userName, email: email, password: password, phone: Int(phone), address: address, country: country)
        onStartedActivity?()
        authenticationService.login(email: email, password: password) { [weak self] (result) in
            self?.onEndedActivity?()
            switch result {
            case .success(let token):
                UserDefaults.standard.setValue(token, forKey: "userToken")
                self?.onAuthSuccess?(user)
            case .failure(let error):
                print(error)
                self?.onAuthFailure?()
            }
        }
    }
}
