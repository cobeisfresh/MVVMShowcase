//
//  NotesViewController.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import UIKit

class NotesViewController: UIViewController {
    
    private lazy var notesView = NotesView()
    var viewModel: NotesViewModel!
    
    var notes: [Note]?
    
    override func loadView() {
        view = notesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigationRightButton()
        addCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        getNotes()
    }
    
    private func addCallbacks() {
        
    }

    private func createNavigationRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem  = rightButton
    }
    
    private func getNotes() {
        let notes = viewModel.getNotes()
        notesView.notes = notes
        notesView.reloadTableView()
    }
    
    @objc func addNote() {
        viewModel.onNoteAdd?()
    }
    
    
    
}
