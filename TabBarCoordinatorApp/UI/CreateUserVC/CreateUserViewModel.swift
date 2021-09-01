//
//  CreateUserViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation

final class CreateUserViewModel {
    // MARK: - Properties
    var onGoToLogin: ((String) -> Void)?
    var onStartedActivity: EmptyCallback?
    var onEndedActivity: EmptyCallback?
    var onError: EmptyCallback?
    
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func register(_ user: User) {
        UserDefaults.standard.set(user.name, forKey: "userName_\(user.email)")
        onStartedActivity?()
        authenticationService.register(email: user.email, password: user.password) { [weak self] (result) in
            switch result {
            case .success(let token):
                self?.onEndedActivity?()
                UserDefaults.standard.setValue(token, forKey: "userToken")
                self?.saveUserToDefaults(user)
                self?.goToLogin(email: user.email)
            case .failure(let error):
                print(error)
                self?.onEndedActivity?()
                self?.onError?()
            }
        }
    }
    
    private func saveUserToDefaults(_ user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: "user_\(user.email.lowercased())")
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
}

// MARK: - Navigation
extension CreateUserViewModel {
    func goToLogin(email: String) {
        onGoToLogin?(email)
    }
}
