//
//  NotesViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation


class NotesViewModel {
    let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    var onNoteAdd: (() -> Void)?
    var onEditNote: ((Note, Int) -> Void)?
    
    func getNotes() -> [Note] {
        var notes = [Note]()
        if let data = UserDefaults.standard.data(forKey: "notes") {
            do {
                let decoder = JSONDecoder()
                let decodedNotes = try decoder.decode([Note].self, from: data)
                for note in decodedNotes {
                    let note = Note(title: note.title, description: note.description, author: note.author, timeStamp: note.timeStamp)
                    
                    notes.append(note)
                }
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return notes
    }
    
    func getCurrentUser() -> String {
        return authenticationService.getCurrentUser()
    }
    
    
}
