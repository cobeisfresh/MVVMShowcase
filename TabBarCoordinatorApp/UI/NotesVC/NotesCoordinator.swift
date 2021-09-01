//
//  NotesCoordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation
import UIKit

class NotesCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = createNotesVC()
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }
    
    private func createNotesVC() -> UIViewController {
        let vc = NotesViewController()
        vc.viewModel = NotesViewModel()
        
        vc.viewModel.onNoteAdd = { [weak self] in
            let addNoteVC = AddNoteViewController(navControlller: self!.navigationController)
            addNoteVC.viewModel = AddNoteViewModel()
            self?.navigationController.pushViewController(addNoteVC, animated: true)
        }
        
        vc.viewModel.onEditNote = { [weak self] note, index in
            let addNoteVC = AddNoteViewController(navControlller: self!.navigationController)
            addNoteVC.viewModel = AddNoteViewModel()
            addNoteVC.addNoteView.setupView(note: note)
            addNoteVC.indexNote = index
            self?.navigationController.pushViewController(addNoteVC, animated: true)
        }
        
//        let addNoteVC = AddNoteViewController(navControlller: navigationController)
//        addNoteVC.viewModel = AddNoteViewModel()
//        addNoteVC.viewModel.onNoteSave = { [weak self] in
//            self?.navigationController.popViewController(animated: true)
//        }
        
        return vc
    }
}
