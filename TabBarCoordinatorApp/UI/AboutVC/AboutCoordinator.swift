//
//  AboutCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit
import Firebase

final class AboutCoordinator: Coordinator {
    var onLogout: (() -> Void)?
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = createAboutVC()
        
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
    
    private func createAboutVC() -> UIViewController {
        let vc = AboutViewController()
        vc.viewModel = AboutViewModel(testService: ServiceFactory.testService, authenticationService: ServiceFactory.authenticationService)
        let userEmail = vc.viewModel.getCurrentUser()
        if let data = UserDefaults.standard.data(forKey: "user_\(userEmail)") {
            do {
                let decoder = JSONDecoder()
                let decodedUser = try decoder.decode(User.self, from: data)
                let user = User(name: decodedUser.name, email: decodedUser.email, password: decodedUser.password, phone: Int(""), address: "", country: "")
                vc.aboutView.setupUserDetails(with: user)
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        
        
        vc.viewModel.onLogoutButtonTapped = { [weak vc] in
            vc?.viewModel.onStartActivity?()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak vc] in
                UserDefaults.standard.set(false, forKey: "isLogged")
                UserDefaults.standard.synchronize()
                vc?.viewModel.onEndActivity?()
                self.onLogout?()
            }
        }

        return vc
    }
    
}
