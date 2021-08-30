//
//  ChangeView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation
import UIKit

class EditView: UIView {
    //MARK: - Outlets
    private lazy var backgroundImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var nameLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var passwordLabel = UILabel()
    private lazy var enterDetailsView = UIView()
    private lazy var phoneDescLabel = UILabel()
    private lazy var phoneTextField = UITextField()
    private lazy var addressDescLabel = UILabel()
    private lazy var addressTextField = UITextField()
    private lazy var countryDescLabel = UILabel()
    private lazy var countryTextField = UITextField()
    private lazy var resetPasswordButton = UIButton(type: .system)
    private lazy var saveDetailsButton = UIButton()

    var viewModel: HomeViewModel!
    
    var onSaveDetailsTapped: ((User) -> Void)?
    var onResetPasswordTapped: ((User) -> Void)?

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
        
        titleLabel.text = "Edit user details"
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        nameLabel.text = "name"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        
        emailLabel.text = "email"
        emailLabel.textColor = .white
        emailLabel.font = UIFont.boldSystemFont(ofSize: 20)
        emailLabel.textAlignment = .center
        emailLabel.numberOfLines = 0
        emailLabel.lineBreakMode = .byTruncatingTail
        addSubview(emailLabel)
        
        passwordLabel.text = "password"
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 20)
        passwordLabel.textAlignment = .center
        addSubview(passwordLabel)
        
        enterDetailsView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        enterDetailsView.layer.cornerRadius = 25
        addSubview(enterDetailsView)
        
        phoneDescLabel.backgroundColor = .clear
        phoneDescLabel.text = "PHONE:"
        phoneDescLabel.textColor = .white
        enterDetailsView.addSubview(phoneDescLabel)
        
        phoneTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        phoneTextField.textColor = .white
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.tintColor = .black
        phoneTextField.placeholder = "Enter phone"
        phoneTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(phoneTextField)
        
        addressDescLabel.backgroundColor = .clear
        addressDescLabel.text = "ADDRESS:"
        addressDescLabel.textColor = .white
        enterDetailsView.addSubview(addressDescLabel)
        
        addressTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        addressTextField.textColor = .white
        addressTextField.layer.cornerRadius = 10
        addressTextField.tintColor = .black
        addressTextField.placeholder = "Enter address"
        addressTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(addressTextField)
        
        countryDescLabel.backgroundColor = .clear
        countryDescLabel.text = "COUNTRY:"
        countryDescLabel.textColor = .white
        enterDetailsView.addSubview(countryDescLabel)
        
        countryTextField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        countryTextField.textColor = .white
        countryTextField.layer.cornerRadius = 10
        countryTextField.tintColor = .black
        countryTextField.placeholder = "Enter country"
        countryTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        enterDetailsView.addSubview(countryTextField)
        
        resetPasswordButton.setTitle("Reset password", for: .normal)
        resetPasswordButton.setTitleColor(.white, for: .normal)
        resetPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        resetPasswordButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        addSubview(resetPasswordButton)
        
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
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: -30),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 250),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            emailLabel.widthAnchor.constraint(equalToConstant: 250),
            
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            passwordLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),
            passwordLabel.widthAnchor.constraint(equalToConstant: 250),
            
            enterDetailsView.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            enterDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            enterDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            enterDetailsView.heightAnchor.constraint(equalToConstant: 325),
            
            phoneDescLabel.heightAnchor.constraint(equalToConstant: 35),
            phoneDescLabel.topAnchor.constraint(equalTo: enterDetailsView.topAnchor, constant: 30),
            phoneDescLabel.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            phoneDescLabel.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            phoneDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            phoneTextField.heightAnchor.constraint(equalToConstant: 35),
            phoneTextField.topAnchor.constraint(equalTo: phoneDescLabel.bottomAnchor, constant: 0),
            phoneTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            phoneTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            phoneTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            addressDescLabel.heightAnchor.constraint(equalToConstant: 35),
            addressDescLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            addressDescLabel.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            addressDescLabel.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            addressDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            addressTextField.heightAnchor.constraint(equalToConstant: 35),
            addressTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            addressTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            addressTextField.topAnchor.constraint(equalTo: addressDescLabel.bottomAnchor, constant: 0),
            addressTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            countryDescLabel.heightAnchor.constraint(equalToConstant: 35),
            countryDescLabel.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20),
            countryDescLabel.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            countryDescLabel.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            countryDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            countryTextField.heightAnchor.constraint(equalToConstant: 35),
            countryTextField.leadingAnchor.constraint(equalTo: enterDetailsView.leadingAnchor, constant: 30),
            countryTextField.trailingAnchor.constraint(equalTo: enterDetailsView.trailingAnchor, constant: -30),
            countryTextField.topAnchor.constraint(equalTo: countryDescLabel.bottomAnchor, constant: 0),
            countryTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            resetPasswordButton.widthAnchor.constraint(equalToConstant: 150),
            resetPasswordButton.topAnchor.constraint(equalTo: enterDetailsView.bottomAnchor, constant: 25),
            resetPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            saveDetailsButton.heightAnchor.constraint(equalToConstant: 50),
            saveDetailsButton.widthAnchor.constraint(equalToConstant: 200),
            saveDetailsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            saveDetailsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
        ])
    }
    
    func setupUserDetails(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        passwordLabel.text = user.password
        
        guard let ph = user.phone else { return }
        phoneTextField.text = "\(ph)"
        addressTextField.text = user.address
        countryTextField.text = user.country
    }
    
    @objc func resetButtonTapped() {
        if let unwrappedName = nameLabel.text, let unwrappedEmail = emailLabel.text, let unwrappedPass = passwordLabel.text, let phone = phoneTextField.text, let address = addressTextField.text, let country = countryTextField.text {
            let user = User(name: unwrappedName, email:unwrappedEmail, password: unwrappedPass, phone: Int(phone), address: address, country: country)
            onResetPasswordTapped?(user)
        }
    }
    
    @objc func saveButtonTapped() {
        if let phone = phoneTextField.text, let address = addressTextField.text, let country = countryTextField.text {
            let user = User(name: "", email: "" , password: "", phone: Int(phone) ?? 00000, address: address, country:  country)
            onSaveDetailsTapped?(user)
        }
    }
}
