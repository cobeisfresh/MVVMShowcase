//
//  AuthenticationService.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 25.08.2021..
//

import Foundation
import FirebaseAuth

public enum AuthenticationResult<Value> {
    case success(Value)
    case failure(AuthenticationError)
}

public enum AuthenticationError: String {
    case alreadyExists = "User with that e-mail already exists."
    case networkError = "There was a problem with the Firebase network, please try again later."
    case emptyResult = "There was an error while creating the account, please try again."
    case general = "There was a problem with the authentication server, please try again later."
    case wrongInformation = "Wrong e-mail or password, please try again."
    case noInternet = "It seems like there is no internet, check your connection and try again."
    
    var textDescription: String {
        return self.rawValue
    }
}

protocol AuthenticationServiceProtocol {
    func register(email: String, password: String, completion: @escaping (AuthenticationResult<String>) -> Void)
    func login(email: String, password: String, completion: @escaping (AuthenticationResult<String>) -> Void)
    func resetPassword(email: String)
}

class AuthenticationService: AuthenticationServiceProtocol {
    
    private let connectivityService: ConnectivityServiceProtocol
    
    init(connectivityService: ConnectivityServiceProtocol) {
        self.connectivityService = connectivityService
    }
    
    func register(email: String, password: String, completion: @escaping (AuthenticationResult<String>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if error != nil {
                self?.handleError(error: error, completion: completion)
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(.emptyResult))
                return
            }
            completion(.success(user.uid))
        }
    }
    
    func login(email: String, password: String, completion: @escaping (AuthenticationResult<String>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if error != nil {
                self?.handleError(error: error, completion: completion)
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(.emptyResult))
                return
            }
            
            completion(.success(user.uid))
        }
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                print("PASSWORD RESET send to \(email)")
                return
            }
        }
    }
}

extension AuthenticationService {
    private func handleError(error: Error?, completion: @escaping (AuthenticationResult<String>) -> Void) {
        guard connectivityService.isConnected else {
            completion(.failure(.noInternet))
            return
        }
        
        guard let firebaseError = AuthErrorCode(rawValue: error!._code) else {
            completion(.failure(.general))
            return
        }
        
        switch firebaseError {
        case .userNotFound, .wrongPassword:
            completion(.failure(.wrongInformation))
        case .emailAlreadyInUse:
            completion(.failure(.alreadyExists))
        case .networkError:
            completion(.failure(.networkError))
        default:
            completion(.failure(.general))
        }
    }
}
