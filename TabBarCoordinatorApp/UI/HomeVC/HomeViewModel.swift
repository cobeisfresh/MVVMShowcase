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
   
    
//    func refreshView(user: User) {
//        let homeVC = tabBarController.viewControllers?[0].children[0].contentViewController as! HomeViewController
//        homeVC.viewModel = HomeViewModel()
//        homeVC.homeView.setupUserDetails(user: user)
//        
//        let aboutVC = tabBarController.viewControllers?[1].children[0].contentViewController as! AboutViewController
//        aboutVC.viewModel = AboutViewModel()
//        aboutVC.aboutView.setupUserDetails(with: user)
//    }
    
}


