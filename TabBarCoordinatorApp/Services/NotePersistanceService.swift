//
//  PersistanceService.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 02.09.2021..
//

import Foundation

protocol NoteRepositoryProtocol {
    func saveNotes(_ notes: [Note])
    func getNotes() -> [Note]
}

class NotePersistanceService: NoteRepositoryProtocol {
    func saveNotes(_ notes: [Note]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(notes)
            UserDefaults.standard.set(data, forKey: "notes")
            UserDefaults.standard.synchronize()
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
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
    
    
}
