//
//  TestService.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 26.08.2021..
//

import Foundation

protocol TestServiceProtocol {
    func getTest(completion: @escaping (Result<EmptyDecodable, ValidationResult>) -> Void)
    func postTest(completion: @escaping (Result<TestModel, ValidationResult>) -> Void)
}

final class TestService: TestServiceProtocol {
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func getTest(completion: @escaping (Result<EmptyDecodable, ValidationResult>) -> Void) {
        let resource = Resource(path: "posts/1",
                                method: .get,
                                type: .json,
                                parameters: nil,
                                query: nil)
        
        dataService.fetch(resource: resource, completion: completion)
    }
    
    func postTest(completion: @escaping (Result<TestModel, ValidationResult>) -> Void) {
        let resource = Resource(path: "posts",
                                method: .post,
                                type: .json,
                                parameters: ["id": 5,
                                             "title": "mojTitle",
                                             "body": "mojbodyString"],
                                query: nil)
        
        dataService.fetch(resource: resource, completion: completion)
    }
}

public struct TestModel: Codable {
    let id: Int
    let title: String
    let body: String
}
