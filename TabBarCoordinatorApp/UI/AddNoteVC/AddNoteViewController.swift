//
//  AddNoteViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import UIKit

class AddNoteViewController: UIViewController{
    
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
            self?.viewModel.handleNoteCreateAndEdit(title: title, description: description, createNote: createNote, indexNote: self?.indexNote ?? 0)
        }
        
        viewModel.onSaveNoteFailure = { [weak self] in
            self?.showMessage(title: "Error", messagae: "Fields can not be empty.")
        }
    }
}
