//
//  NotesView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation
import UIKit

class NotesView: UIView {
    private lazy var backgroundImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var notesTableview = UITableView()
    
    var viewModel = NotesViewModel(authenticationService: ServiceFactory.authenticationService, notePersistanceService: ServiceFactory.notePersistanceService)
    
    var onCheckUserForEdit: ((Note, Int)-> Void)?
    
    var notes = [Note]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        notesTableview.delegate = self
        notesTableview.dataSource = self
        registerCell()
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCell() {
        notesTableview.register(UINib(nibName: "NotesTableViewCell", bundle: nil), forCellReuseIdentifier: "NotesTableViewCell")
    }
    
    private func setupView() {
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        
        titleLabel.text = "All notes"
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        notesTableview.backgroundColor = .clear
        addSubview(notesTableview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
          
            notesTableview.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            notesTableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            notesTableview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            notesTableview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func reloadTableView() {
        notesTableview.reloadData()
    }
    
}

extension NotesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
        
        cell.setupView(title: (notes[indexPath.row].title), description: notes[indexPath.row].description, author: notes[indexPath.row].author, time: notes[indexPath.row].timeStamp)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userEmail = viewModel.getCurrentUser()
        let note = notes[indexPath.row]
        let isAuthor = note.canEdit(email: userEmail)
        if isAuthor {
            onCheckUserForEdit?(note, indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
