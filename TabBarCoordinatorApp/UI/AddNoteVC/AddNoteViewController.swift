//
//  AddNoteViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import UIKit
import Firebase

class AddNoteViewController: UIViewController{
    var navController = UINavigationController()
    init(navControlller: UINavigationController) {
        self.navController = navControlller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var addNoteView = AddNoteView()
    var viewModel: AddNoteViewModel!
    var indexNote: Int!
    
    override func loadView() {
        view = addNoteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        addCallbacks()
    }
    
    private func addCallbacks() {
        addNoteView.onConfirmButtonTapped = { [weak self] title, description in
            guard let createNote = self?.addNoteView.checkForCreate() else  { return }
            if let canProceed = self?.viewModel.checkForEmptyFields(title: title, description: description) {
                if canProceed {
                    let date = self?.viewModel.createDate() ?? "Unknown date"
                    let author = Auth.auth().currentUser?.email ?? "Unknown author"
                    let newNote = Note(title: title, description: description, author: author, timeStamp: date)
                    
                    if createNote {
                        var currentNotes = self?.viewModel.getNotes()
                        currentNotes?.append(newNote)
                        self?.viewModel.saveNotes(notes: currentNotes ?? [])
                    }
                    else {
                        var currentNotes = self?.viewModel.getNotes()
                        currentNotes?.remove(at: self?.indexNote ?? 0)
                        currentNotes?.insert(newNote, at: self?.indexNote ?? 0)
                        self?.viewModel.saveNotes(notes: currentNotes ?? [])
                    }
//                    self?.viewModel.onNoteSave?()
                    self?.navController.popViewController(animated: true)
                }
                else {
                    self?.showMessage(title: "Error", messagae: "Fields can not be empty.")
                }
            }
        }
    }
}
