//
//  AboutViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class AboutViewModel {
    func logoutAndGoToLoginVC() {
        let aboutCcoordinator = AboutCoordinator()
        _ = aboutCcoordinator.logOut()
    }
}
