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
    
    func checkForEmptyFields(title: String, description: String) -> Bool {
        if title != "" && description != "" {
            return true
        }
        else {
            return false
        }
    }
    
    func saveNotes(notes: [Note]) {
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
                    let mynote = Note(title: note.title, description: note.description, author: note.author, timeStamp: note.timeStamp)
                
                    notes.append(mynote)
                }
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return notes
    }
    
    func createDate() -> String {
        let date = Date()
        let formatedDate = date.getFormattedDate(format: "yyyy-MM-dd, HH:mm:ss")
        
        return formatedDate
    }
    
}

extension AddNoteViewModel {
    func save() {
        onNoteSave?()
    }
}
