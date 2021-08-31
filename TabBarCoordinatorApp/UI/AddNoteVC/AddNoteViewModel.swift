//
//  AddNoteViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation

class AddNoteViewModel {
    var onConfirmTapped: (() -> Void)?
    var onNoteSave: (() -> Void)?
    
}

extension AddNoteViewModel {
    func save() {
        onNoteSave?()
    }
}
