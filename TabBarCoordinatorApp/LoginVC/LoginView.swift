//
//  LoginView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class LoginView: UIView {
    //MARK: - Outlets
    private lazy var backgroundImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var enterDetailsView = UIView()
    private lazy var nameTextField = UITextField()
    private lazy var passTextField = UITextField()
    private lazy var loginButton = UIButton(type: .system)
    private lazy var createButton = UIButton(type: .system)
    
    var viewModel: LoginViewModel!
    
    var onCreateTapped: (()->Void)?
    var onLoginTapped: ((User)->Void)?
    
    
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
        backgroundColor = .white
        
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.text = "TabbarCoordinatorMVVM"
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        enterDetailsView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        enterDetailsView.layer.cornerRadius = 25
        addSubview(enterDetailsView)
        
        nameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        nameTextField.layer.cornerRadius = 10
        nameTextField.tintColor = .black
        nameTextField.placeholder = "Enter name"
        nameTextField.textColor = .white
        enterDetailsView.addSubview(nameTextField)
        
        passTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        passTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        passTextField.layer.cornerRadius = 10
        passTextField.tintColor = .black
        passTextField.placeholder = "Enter password"
        passTextField.textColor = .white
        passTextField.isSecureTextEntry = true
        enterDetailsView.addSubview(passTextField)
        
        loginButton.backgroundColor = .white
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        enterDetailsView.addSubview(loginButton)
        
        createButton.setTitle("Create User", for: .normal)
        createButton.setTitleColor(.white, for: .normal)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        addSubview(createButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            enterDetailsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            enterDetailsView.heightAnchor.constraint(equalToConstant: 300),
            enterDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            enterDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            nameTextField.widthAnchor.constraint(equalToConstant: 200),
            nameTextField.topAnchor.constraint(equalTo: enterDetailsView.topAnchor, constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: enterDetailsView.centerXAnchor),
            
            passTextField.heightAnchor.constraint(equalToConstant: 35),
            passTextField.widthAnchor.constraint(equalToConstant: 200),
            passTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            passTextField.centerXAnchor.constraint(equalTo: enterDetailsView.centerXAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: enterDetailsView.bottomAnchor, constant: -25),
            
            createButton.heightAnchor.constraint(equalToConstant: 50),
            createButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
        ])
    }
    
    func clearTextFields() {
        nameTextField.text = ""
        passTextField.text = ""
    }
    
    @objc func loginButtonTapped() {
        if let name = nameTextField.text, let pass = passTextField.text, let email = nameTextField.text {
            let user = User(name: name, email: email, password: pass)
            onLoginTapped?(user)
        }
    }
    
    @objc func createButtonTapped() {
        print("User creating requested")
        onCreateTapped?()
        
    }
}
