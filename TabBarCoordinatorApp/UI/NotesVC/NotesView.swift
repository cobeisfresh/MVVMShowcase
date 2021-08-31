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
    private lazy var notesTableview = UITableView()
    
    
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
        
        notesTableview.backgroundColor = .clear
        addSubview(notesTableview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
          
            notesTableview.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            notesTableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            notesTableview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            notesTableview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
}

extension NotesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
        
        cell.setupView(title: "Title", description: "Some text Some text Some text Some text Some text Some text Some text  Some text Some text Some textSome text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text", author: "Name Surname")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
        
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
}
