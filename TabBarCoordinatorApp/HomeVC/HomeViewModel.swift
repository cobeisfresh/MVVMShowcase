//
//  HomeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class HomeViewModel {
    var onUserDetailsChange: ((User) -> Void)?
    var onSetupUserDetails: (() -> Void)?
    
    func changeUserDetails(user: User) {
        onUserDetailsChange?(user)
    }
    
    
}


