//
//  User.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let password: String
    let phone: Int?
    let address: String?
    let country: String?
}
