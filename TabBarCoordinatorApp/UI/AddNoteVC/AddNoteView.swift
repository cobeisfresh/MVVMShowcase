//
//  AddNoteView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 31.08.2021..
//

import Foundation
import UIKit

class AddNoteView: UIView {
    
    private lazy var backgroundImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var titleTextField = UITextField()
    private lazy var descriptionTextView = UITextView()
    private lazy var confirmButton = UIButton(type: .system)
    
    var onConfirmButtonTapped: ((String, String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
    
        titleLabel.text = "Create new note"
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        titleTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        titleTextField.textColor = .white
        titleTextField.layer.cornerRadius = 10
        titleTextField.tintColor = .black
        titleTextField.placeholder = "Enter name"
        titleTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        addSubview(titleTextField)
        
        descriptionTextView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        descriptionTextView.textColor = .white
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.tintColor = .black
        descriptionTextView.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        addSubview(descriptionTextView)
        
        confirmButton.backgroundColor = .white
        confirmButton.layer.borderWidth = 1
        confirmButton.layer.borderColor = UIColor.black.cgColor
        confirmButton.layer.masksToBounds = true
        confirmButton.layer.cornerRadius = 25
        confirmButton.clipsToBounds = true
        confirmButton.setTitle("Create note", for: .normal)
        confirmButton.setTitleColor(UIColor.black, for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        addSubview(confirmButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 25),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            confirmButton.widthAnchor.constraint(equalToConstant: 200),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
        ])
    }
    
    
    @objc func confirmButtonTapped() {
        print("CONFIRM TAPPED")
        if let title = titleTextField.text, let description = descriptionTextView.text {
            onConfirmButtonTapped?(title, description)
        }
    }
    
}
