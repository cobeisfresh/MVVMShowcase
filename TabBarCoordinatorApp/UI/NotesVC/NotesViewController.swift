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

    
    override func loadView() {
        view = notesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        createNavigationRightButton()
        addCallbacks()
    }
    
    private func addCallbacks() {
        
    }

    
    private func createNavigationRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem  = rightButton
    }
    
    @objc func addNote() {
        print("add")
        viewModel.onNoteAdd?()
    }
    
    
}
