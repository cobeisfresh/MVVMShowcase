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
    var onStartedActivity: EmptyCallback?
    var onEndedActivity: EmptyCallback?
    var onError: EmptyCallback?
    
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func register(_ user: User) {
        UserDefaults.standard.set(user.name, forKey: "userName")
        onStartedActivity?()
        authenticationService.register(email: user.email, password: user.password) { [weak self] (result) in
            switch result {
            case .success(let token):
                self?.onEndedActivity?()
                UserDefaults.standard.setValue(token, forKey: "userToken")
                self?.goToLogin()
            case .failure(let error):
                print(error)
                self?.onEndedActivity?()
                self?.onError?()
            }
        }
    }
    
    //    func saveUser(_ user: User) {
    //        UserDefaults.standard.set(user.name, forKey: "userName")
    //        UserDefaults.standard.set(user.email, forKey: "userEmail")
    //        UserDefaults.standard.set(user.password, forKey: "userPass")
    //    }
}

// MARK: - Navigation
extension CreateUserViewModel {
    func goToLogin() {
        onGoToLogin?()
    }
}
