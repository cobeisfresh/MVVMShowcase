//
//  Note.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation

struct Note: Codable {
    let title: String
    let description: String
    let author: String
    let timeStamp: String
}

extension Note {
    func canEdit(email: String) -> Bool {
        return author.lowercased() == email.lowercased()
    }
}
