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
        vc.viewModel = NotesViewModel(authenticationService: ServiceFactory.authenticationService, notePersistanceService: ServiceFactory.notePersistanceService)
        
        vc.viewModel.onNoteAdd = { [weak self] in
            let addNoteVC = AddNoteViewController()
            addNoteVC.viewModel = AddNoteViewModel(authenticationService: ServiceFactory.authenticationService, notePersistanceService: ServiceFactory.notePersistanceService)
            addNoteVC.viewModel.onSaveNoteSuccess = { [weak self] in
                self?.navigationController.popViewController(animated: true)
            }
            self?.navigationController.pushViewController(addNoteVC, animated: true)
        }
        
        vc.viewModel.onEditNote = { [weak self] note, index in
            let addNoteVC = AddNoteViewController()
            addNoteVC.viewModel = AddNoteViewModel(authenticationService: ServiceFactory.authenticationService, notePersistanceService: ServiceFactory.notePersistanceService)
            addNoteVC.addNoteView.setupView(note: note)
            addNoteVC.indexNote = index
            addNoteVC.viewModel.onSaveNoteSuccess = { [weak self] in
                self?.navigationController.popViewController(animated: true)
            }
            self?.navigationController.pushViewController(addNoteVC, animated: true)
        }
        return vc
    }
    
}
