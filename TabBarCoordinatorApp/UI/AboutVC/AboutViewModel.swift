//
//  AboutViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class AboutViewModel {
    var onLogoutTapped: (()->Void)?
    
    let testService: TestServiceProtocol
    
    init(testService: TestServiceProtocol) {
        self.testService = testService
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
        onLogoutTapped?()
    }
}
