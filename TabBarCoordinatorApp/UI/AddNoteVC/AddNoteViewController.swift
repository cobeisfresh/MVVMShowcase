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
            self?.viewModel.handleNoteCreateAndEdit(title: title, description: description, createNote: createNote, indexNote: self?.indexNote ?? 0)
        }
        
        viewModel.onSaveFailure = { [weak self] in
            self?.showMessage(title: "Error", messagae: "Fields can not be empty.")
        }
        
        viewModel.onNoteSave = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
