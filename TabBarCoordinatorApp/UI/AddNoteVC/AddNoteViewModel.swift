//
//  AddNoteViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation

class AddNoteViewModel {
    var onConfirmTapped: (() -> Void)?
    var onSaveNoteSuccess: (() -> Void)?
    var onSaveNoteFailure: (() -> Void)?
    
    let authenticationService: AuthenticationServiceProtocol
    let notePersistanceService: NoteRepositoryProtocol
    
    init(authenticationService: AuthenticationServiceProtocol, notePersistanceService: NotePersistanceService) {
        self.authenticationService = authenticationService
        self.notePersistanceService = notePersistanceService
    }
    
    private func getCurrentUser() -> String {
        return authenticationService.getCurrentEmail()
    }
    
    func checkForEmptyFields(title: String, description: String) -> Bool {
        if title != "" && description != "" {
            return true
        }
        else {
            return false
        }
    }
    
    func saveNotes(notes: [Note]) {
        notePersistanceService.saveNotes(notes)
    }
    
    func getNotes() -> [Note] {
        return notePersistanceService.getNotes()
    }
    
    func handleNoteCreateAndEdit(title: String, description: String, createNote: Bool, indexNote: Int) {
        let date = createDate()
        let author = getCurrentUser()
        let newNote = Note(title: title, description: description, author: author, timeStamp: date)
        let canProceed = checkForEmptyFields(title: title, description: description)
        if canProceed {
            if createNote {
                var currentNotes = getNotes()
                currentNotes.append(newNote)
                saveNotes(notes: currentNotes)
            }
            else {
                var currentNotes = getNotes()
                currentNotes.remove(at: indexNote)
                currentNotes.insert(newNote, at: indexNote)
                saveNotes(notes: currentNotes)
            }
            onSaveNoteSuccess?()
        }
        else {
            onSaveNoteFailure?()
        }
    }
    
    func createDate() -> String {
        let date = Date()
        let formatedDate = date.getFormattedDate(format: "yyyy-MM-dd, HH:mm:ss")
        return formatedDate
    }
    
}
