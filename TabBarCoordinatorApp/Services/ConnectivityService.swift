//
//  AuthenticationService.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 25.08.2021..
//

import Foundation
import Alamofire

protocol ConnectivityServiceProtocol {
    var isConnected: Bool { get }
}

class ConnectivityService: ConnectivityServiceProtocol {
    
    private var networkManager = NetworkReachabilityManager()

    
    var isConnected: Bool {
        return networkManager?.isReachable ?? false
    }
    
}
