//
//  ServiceFactory.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 25.08.2021..
//

import Foundation

final class ServiceFactory {
    static var connectivityService: ConnectivityServiceProtocol = {
        return ConnectivityService()
    }()
    
    static var authenticationService: AuthenticationServiceProtocol = {
        return AuthenticationService(connectivityService: connectivityService)
    }()
    
    static var networkConfiguration: NetworkConfiguration = {
        return NetworkConfiguration(baseURL: "https://jsonplaceholder.typicode.com/", staticHeaders: nil, authorizationHeaders: nil)
    }()
    
    static var dataService: DataServiceProtocol = {
        return DataService(networkConfiguration: networkConfiguration, enableIncognito: false)
    }()
    
    static var testService: TestServiceProtocol = {
        return TestService(dataService: dataService)
    }()
}
