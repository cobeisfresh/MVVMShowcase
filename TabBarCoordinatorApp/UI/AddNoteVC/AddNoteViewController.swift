//
//  AddNoteViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import UIKit

class AddNoteViewController: UIViewController{
    
    var navController = UINavigationController()
    init(navControlller: UINavigationController) {
        self.navController = navControlller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var addNoteView = AddNoteView()
    var viewModel: AddNoteViewModel!
    
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
            if let canProceed = self?.viewModel.checkForEmptyFields(title: title, description: description) {
                if canProceed {
                    let newNote = Note(title: title, description: description, author: "author", timeStamp: "time")
                    
                    var currentNotes = self?.viewModel.getNotes()
                    currentNotes?.append(newNote)
                    self?.viewModel.saveNotes(notes: currentNotes ?? [])
        
                    self?.navController.popViewController(animated: true)
                }
                else {
                    self?.showMessage(title: "Error", messagae: "Fields can not be empty.")
                }
            }
        }
    }
    
}
