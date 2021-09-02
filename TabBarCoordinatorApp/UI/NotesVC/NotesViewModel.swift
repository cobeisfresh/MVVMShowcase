//
//  NotesViewModel.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation


class NotesViewModel {
    let authenticationService: AuthenticationServiceProtocol
    let notePersistanceService: NoteRepositoryProtocol
    
    init(authenticationService: AuthenticationServiceProtocol, notePersistanceService: NotePersistanceService) {
        self.authenticationService = authenticationService
        self.notePersistanceService = notePersistanceService
    }
    
    var onNoteAdd: (() -> Void)?
    var onEditNote: ((Note, Int) -> Void)?
    
    func getNotes() -> [Note] {
        return notePersistanceService.getNotes()
    }
    
    func getCurrentUser() -> String {
        return authenticationService.getCurrentEmail()
    }
    
}
