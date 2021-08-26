//
//  ServiceFactory.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 25.08.2021..
//

import Foundation

class ServiceFactory {
    static var connectivityService: ConnectivityServiceProtocol = {
        return ConnectivityService()
    }()
    
    static var authenticationService: AuthenticationServiceProtocol = {
        return AuthenticationService(connectivityService: connectivityService)
    }()
}
