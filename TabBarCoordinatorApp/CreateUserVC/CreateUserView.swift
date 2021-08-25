//
//  CreateUserView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class CreateUserView: UIView {
    
    //MARK: - Outlets
    private lazy var backgroundImage = UIImageView()
    private lazy var enterDetailsView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var nameTextField = UITextField()
    private lazy var emailTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var createButton = UIButton(type: .system)
       
    var viewModel: LoginViewModel!
    var onCreateUser: ((User) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    func setupView() {
        backgroundColor = .white
        
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        
        enterDetailsView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        enterDetailsView.layer.cornerRadius = 25
        addSubview(enterDetailsView)
        
        titleLabel.text = "Create new user"
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        nameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        nameTextField.textColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.tintColor = .black
        nameTextField.placeholder = "Enter name"
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(nameTextField)
        
        emailTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        emailTextField.textColor = .white
        emailTextField.layer.cornerRadius = 10
        emailTextField.tintColor = .black
        emailTextField.placeholder = "Enter email"
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(emailTextField)
        
        passwordTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        passwordTextField.textColor = .white
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.tintColor = .black
        passwordTextField.placeholder = "Enter password"
        passwordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(passwordTextField)
        
        createButton.backgroundColor = .white
        createButton.layer.borderWidth = 1
        createButton.layer.borderColor = UIColor.black.cgColor
        createButton.layer.masksToBounds = true
        createButton.layer.cornerRadius = 25
        createButton.clipsToBounds = true
        createButton.setTitle("Create user", for: .normal)
        createButton.setTitleColor(UIColor.black, for: .normal)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        addSubview(createButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            enterDetailsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            enterDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            enterDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            enterDetailsView.heightAnchor.constraint(equalToConstant: 300),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            nameTextField.topAnchor.constraint(equalTo: enterDetailsView.topAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            emailTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),

            createButton.heightAnchor.constraint(equalToConstant: 50),
            createButton.widthAnchor.constraint(equalToConstant: 200),
            createButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            createButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
        ])
    }
    
    @objc func createButtonTapped() {
        if let name = nameTextField.text, let email = emailTextField.text, let pass = passwordTextField.text {
            let user = User(name: name, email: email, password: pass)            
            onCreateUser?(user)
        }
    }
}
