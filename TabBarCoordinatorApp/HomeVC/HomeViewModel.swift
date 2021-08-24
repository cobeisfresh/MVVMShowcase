//
//  HomeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class HomeViewModel {
    func changeUserDetails(user: User) {
        let homeCoordinator = HomeCoordinator()
        _ = homeCoordinator.changeUserDetailsVC(with: user)
    }
}


