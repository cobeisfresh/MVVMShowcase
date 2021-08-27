//
//  DataService.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 26.08.2021..
//

import Foundation

// MARK: - Request method & type
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum RequestType: String {
    case json = "Application/json; charset=utf-8"
    case query = "Application/x-www-form-urlencoded; charset=utf-8"
}

// MARK: - Network configuration & resource model
public struct NetworkConfiguration {
    let baseURL: String
    let staticHeaders: [String: String]?
    let authorizationHeaders: [String: String]?
}

public struct Resource {
    let path: String
    let method: HTTPMethod
    let type: RequestType
    let parameters: [String: Any]?
    let query: String?
}

public struct EmptyDecodable: Decodable {}

// MARK: - RequestResult, Validation result (response codes)

public enum RequestResult<Value> where Value: Decodable {
    case success(Value)
    case failure(ValidationResult)
}

public enum ValidationResult {
    
    case notFound
    case badRequest
    case unauthorized
    case forbidden
    case notAllowed
    case timeout
    case serverError
    case noInternet
    case clientError // -> Returned if dataTask(...) fails with NSError and the error is not caused by connectivity.
    case cannotParse
    case other(Int)
    
    init(code: Int) {
        switch code {
        case 500..<600: self = .serverError
        case 404: self = .notFound
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 405: self = .notAllowed
        case 408: self = .timeout
        default: self = .other(code)
        }
    }
}

// MARK: - Data service

protocol DataServiceProtocol {
    func fetch<Value>(resource: Resource, completion: @escaping (RequestResult<Value>) -> ())
}

final class DataService: DataServiceProtocol {
    private var urlSession: URLSession
    private let sessionConfig: URLSessionConfiguration
    private let networkConfig: NetworkConfiguration
    
    init(networkConfiguration: NetworkConfiguration, enableIncognito: Bool = false) {
        self.sessionConfig = enableIncognito ? URLSessionConfiguration.ephemeral : URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: self.sessionConfig)
        self.networkConfig = networkConfiguration
    }
    
    func fetch<Value>(resource: Resource, completion: @escaping (RequestResult<Value>) -> ()) {
        
        guard let urlRequest = configureRequest(resource) else {
            completion(.failure(.clientError))
            return
        }
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if error != nil || data == nil {
                // NOTE: - NSURLErrorCannotConnectToHost is not a valid connection test
                if let error = error as? NSError, (error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorNetworkConnectionLost || error.code == NSURLErrorCannotConnectToHost) {
                    completion(.failure(.noInternet))
                    return
                }
                completion(.failure(.clientError))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                print("Error: Expecting HTTP/HTTPS response, check baseURL")
                completion(.failure(.clientError))
                return
            }
            
            //            guard let mime = response.mimeType, mime == "application/json" else {
            //                return
            //            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(ValidationResult(code: response.statusCode)))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Value.self, from: data!)
                print(json)
                completion(.success(json))
            } catch {
                print("JSON error: \(error.localizedDescription)")
                completion(.failure(.cannotParse))
                return
            }
        }
        .resume()
    }
}

extension DataService {
    /// Configures the URLRequest using the resources path, method & type parameters. It also attaches any headers and/or authorization from the data services network configuration property.
    private func configureRequest(_ resource: Resource) -> URLRequest? {
        let urlString = networkConfig.baseURL + resource.path
        guard let url = URL(string: urlString) else {
            print("Error creating request URL with: \(urlString)")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        // Method & content type
        urlRequest.httpMethod = resource.method.rawValue
        urlRequest.setValue(resource.type.rawValue, forHTTPHeaderField: "Content-Type")
        // Headers
        if let headers = networkConfig.staticHeaders {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let authorization = networkConfig.authorizationHeaders {
            for (key, value) in authorization {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        // Parameters & query
        if let parameters = resource.parameters {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
        
        if let query = resource.query {
            urlRequest.url = URL(string: urlString.appending(query))
        }
        
        return urlRequest
    }
}
