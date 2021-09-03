//
//  HomeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit
import Firebase

class HomeViewModel {
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    var onChangeDetailsTapped: ((User) -> Void)?
    var onShouldShowEditVC: ((User)->Void)?
    
    func getCurrentUser() -> String {
        return authenticationService.getCurrentEmail()
    }

}


