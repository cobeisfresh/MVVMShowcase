//
//  AboutViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class AboutViewModel {
    var onLogoutButtonTapped: (() -> Void)?
    
    var onStartActivity: (()->Void)?
    var onEndActivity: (()->Void)?

    let testService: TestServiceProtocol
    let authenticationService: AuthenticationServiceProtocol
    
    init(testService: TestServiceProtocol, authenticationService: AuthenticationServiceProtocol) {
        self.testService = testService
        self.authenticationService = authenticationService
    }
    
    func getCurrentUser() -> String {
        return authenticationService.getCurrentUser()
    }
    
    func testGET() {
        testService.getTest { (result) in
            switch result {
            case .success(_):
                print("success!")
            case .failure(let error):
                switch error {
                case .noInternet:
                    print("no intetnet error!")
                default:
                    print("Error getTest: \(error)")
                }
            }
        }
    }
    
    func test() {
        testService.postTest { (result) in
            switch result {
            case .success(let data):
                print("success!")
                print(data)
            case .failure(let error):
                switch error {
                case .noInternet:
                    print("no intetnet error!")
                default:
                    print("Error getTest: \(error)")
                }
            }
        }
    }
    
    func logout() {
        UserDefaults.standard.setValue(nil, forKey: "userToken")
        onLogoutButtonTapped?()
    }
}
