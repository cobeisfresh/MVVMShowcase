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
    var onLoginTapped: (([String]) -> Void)?
    
    func getDataAndCheckLogin(_ name: String, _ email: String, _ pass: String) -> Bool {
        let userName = UserDefaults.standard.string(forKey: "userName")
        let userEmail = UserDefaults.standard.string(forKey: "userEmail")
        let userPass = UserDefaults.standard.string(forKey: "userPass")
    
        var match = Bool()
        
        if name == userName && pass == userPass {
            self.onLoginTapped?([name, String(userEmail!), pass])
            print("User logged")
            match = true
        }
        else {
            print("Wrong name or pass")
            match = false
        }
        return match
    }
}
