//
//  ChangeView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation
import UIKit

class ChangeView: UIView {
    //MARK: - Outlets
    private lazy var backgroundImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var enterDetailsView = UIView()
    private lazy var nameDescLabel = UILabel()
    private lazy var nameTextField = UITextField()
    private lazy var emailDescLabel = UILabel()
    private lazy var emailTextField = UITextField()
    private lazy var passDescLabel = UILabel()
    private lazy var passTextField = UITextField()
    private lazy var saveDetailsButton = UIButton()

    var viewModel: HomeViewModel!
    
    var onSaveDetailsTapped: ((User) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    private func setupView() {
       backgroundColor = .green
        
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        
        titleLabel.text = "Change user details"
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        enterDetailsView.backgroundColor = .white.withAlphaComponent(0.3)
        enterDetailsView.layer.cornerRadius = 25
        addSubview(enterDetailsView)
        
        nameDescLabel.backgroundColor = .clear
        nameDescLabel.text = "NAME:"
        nameDescLabel.textColor = .white
        enterDetailsView.addSubview(nameDescLabel)
        
        nameTextField.backgroundColor = .white.withAlphaComponent(0.2)
        nameTextField.textColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.tintColor = .black
        nameTextField.placeholder = "Enter name"
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(nameTextField)
        
        emailDescLabel.backgroundColor = .clear
        emailDescLabel.text = "EMAIL:"
        emailDescLabel.textColor = .white
        enterDetailsView.addSubview(emailDescLabel)
        
        emailTextField.backgroundColor = .white.withAlphaComponent(0.2)
        emailTextField.textColor = .white
        emailTextField.layer.cornerRadius = 10
        emailTextField.tintColor = .black
        emailTextField.placeholder = "Enter email"
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(emailTextField)
        
        passDescLabel.backgroundColor = .clear
        passDescLabel.text = "PASSWORD:"
        passDescLabel.textColor = .white
        enterDetailsView.addSubview(passDescLabel)
        
        passTextField.backgroundColor = .white.withAlphaComponent(0.2)
        passTextField.textColor = .white
        passTextField.layer.cornerRadius = 10
        passTextField.tintColor = .black
        passTextField.placeholder = "Enter password"
        passTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(passTextField)
        
        saveDetailsButton.backgroundColor = .white
        saveDetailsButton.layer.borderWidth = 1
        saveDetailsButton.layer.borderColor = UIColor.black.cgColor
        saveDetailsButton.layer.masksToBounds = true
        saveDetailsButton.layer.cornerRadius = 25
        saveDetailsButton.setTitle("Save changes", for: .normal)
        saveDetailsButton.setTitleColor(UIColor.black, for: .normal)
        saveDetailsButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        addSubview(saveDetailsButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            enterDetailsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            enterDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            enterDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            enterDetailsView.heightAnchor.constraint(equalToConstant: 375),
            
            nameDescLabel.heightAnchor.constraint(equalToConstant: 35),
            nameDescLabel.topAnchor.constraint(equalTo: enterDetailsView.topAnchor, constant: 30),
            nameDescLabel.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            nameDescLabel.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            nameDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            nameTextField.topAnchor.constraint(equalTo: nameDescLabel.bottomAnchor, constant: 0),
            nameTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            emailDescLabel.heightAnchor.constraint(equalToConstant: 35),
            emailDescLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            emailDescLabel.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            emailDescLabel.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            emailDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            emailTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            emailTextField.topAnchor.constraint(equalTo: emailDescLabel.bottomAnchor, constant: 0),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            passDescLabel.heightAnchor.constraint(equalToConstant: 35),
            passDescLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            passDescLabel.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            passDescLabel.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            passDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            passTextField.heightAnchor.constraint(equalToConstant: 35),
            passTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            passTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            passTextField.topAnchor.constraint(equalTo: passDescLabel.bottomAnchor, constant: 0),
            passTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            saveDetailsButton.heightAnchor.constraint(equalToConstant: 50),
            saveDetailsButton.widthAnchor.constraint(equalToConstant: 200),
            saveDetailsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            saveDetailsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
        ])
    }
    
    func setupUserDetails(with user: User) {
        nameTextField.text = user.name
        emailTextField.text = user.email
        passTextField.text = user.password
    }
    
    @objc func saveButtonTapped() {
        if let name = nameTextField.text, let email = emailTextField.text, let pass = passTextField.text {
            let user = User(name: name, email: email, password: pass)
            onSaveDetailsTapped?(user)
        }
    }
}
