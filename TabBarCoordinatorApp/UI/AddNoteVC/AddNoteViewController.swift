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
        addCallbacks()
    }
    
    private func addCallbacks() {
        addNoteView.onConfirmButtonTapped = { [weak self] title, description in
            print("title: \(title)")
            print("desc: \(description)")
            
            self?.navController.dismiss(animated: true, completion:{
                self?.viewModel.onNoteSave?()
            })
            
        }
    }

}
