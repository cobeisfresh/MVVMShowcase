//
//  NotesTableViewCell.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    private lazy var noteView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var authorLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCellView()
        setupConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCellView() {
        backgroundColor = .clear
        
        noteView.backgroundColor = .white.withAlphaComponent(0.3)
        noteView.layer.cornerRadius = 25
        addSubview(noteView)
        
        titleLabel.textAlignment = .center
        noteView.addSubview(titleLabel)
        
        descriptionLabel.numberOfLines = 0
        noteView.addSubview(descriptionLabel)
        
        authorLabel.textAlignment = .right
        noteView.addSubview(authorLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            noteView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            noteView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            noteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            noteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            titleLabel.topAnchor.constraint(equalTo: noteView.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -15),
            
            authorLabel.heightAnchor.constraint(equalToConstant: 30),
            authorLabel.widthAnchor.constraint(equalToConstant: 150),
            authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            authorLabel.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -15),
        ])
    }
    
    func setupView(title: String, description: String, author: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        authorLabel.text = author
    }
    
}
