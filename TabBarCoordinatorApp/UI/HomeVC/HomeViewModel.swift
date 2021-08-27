//
//  HomeViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class HomeViewModel {
    var onChangeDetailsTapped: ((User) -> Void)?
    var onShouldShowEditVC: ((User)->Void)?
    
    func aa() {
        onChangeDetailsTapped = { user in
            print(user.address as Any)
        }
    }
    
}


