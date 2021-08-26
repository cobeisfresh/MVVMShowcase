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
        let userName = UserDefaults.standard.string(forKey: "userName") ?? ""
        let user = User(name: userName, email: email, password: password)
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
    
    //    func getDataAndCheckLogin(_ name: String, _ email: String, _ pass: String) -> Bool {
    //        let userName = UserDefaults.standard.string(forKey: "userName") ?? ""
    //        let userEmail = UserDefaults.standard.string(forKey: "userEmail") ?? ""
    //        let userPass = UserDefaults.standard.string(forKey: "userPass") ?? ""
    //        let user = User(name: userName, email: userEmail, password: userPass)
    //        var match = Bool()
    //
    //        if name == user.name && user.password == userPass {
    //            match = true
    //            self.onAuthSuccess?(user)
    //        }
    //        else {
    //            match = false
    //            self.onAuthFailure?()
    //        }
    //        return match
    //    }
}
