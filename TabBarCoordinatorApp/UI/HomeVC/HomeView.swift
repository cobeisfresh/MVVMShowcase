//
//  HomeView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

class HomeView: UIView {
    //MARK: - Outlets
    private lazy var backgroundImage = UIImageView()
    private lazy var coverImage = UIImageView()
    private lazy var userImage = UIImageView()
    private lazy var detailsView = UIView()
    private lazy var changeButton = UIButton(type: .system)
    private lazy var nameDescLabel = UILabel()
    private lazy var nameLabel = UILabel()
    private lazy var emailDescLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var passDescLabel =  UILabel()
    private lazy var passLabel = UILabel()
    
    var viewModel: HomeViewModel!
    
    var onChangeTapped: ((User)->Void)?
    
    
    
    
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
        backgroundColor = . yellow
        
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        
        coverImage.image = UIImage(named: "cover")
        addSubview(coverImage)
        
        userImage.image = UIImage(named: "user")
        userImage.setRounded()
        addSubview(userImage)
        
        detailsView.backgroundColor = .clear
        addSubview(detailsView)
        
        changeButton.backgroundColor = .white
        changeButton.layer.borderWidth = 1
        changeButton.layer.borderColor = UIColor.black.cgColor
        changeButton.layer.masksToBounds = true
        changeButton.setTitle("Change details", for: .normal)
        changeButton.setTitleColor(UIColor.black, for: .normal)
        changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        changeButton.layer.masksToBounds = true
        changeButton.layer.cornerRadius = 25
        addSubview(changeButton)
        
        nameDescLabel.backgroundColor = .clear
        nameDescLabel.text = "NAME:"
        nameDescLabel.textColor = .white
        addSubview(nameDescLabel)
        
        nameLabel.backgroundColor = .white
        nameLabel.text = "name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .white
        addSubview(nameLabel)
        
        emailDescLabel.backgroundColor = .clear
        emailDescLabel.text = "EMAIL:"
        emailDescLabel.textColor = .white
        addSubview(emailDescLabel)
        
        emailLabel.backgroundColor = .white
        emailLabel.text = "email"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 17)
        emailLabel.backgroundColor = .clear
        emailLabel.textColor = .white
        addSubview(emailLabel)
        
        passDescLabel.backgroundColor = .clear
        passDescLabel.text = "PASSWORD:"
        passDescLabel.textColor = .white
        addSubview(passDescLabel)
        
        passLabel.backgroundColor = .white
        passLabel.text = "password"
        passLabel.font = UIFont.boldSystemFont(ofSize: 17)
        passLabel.backgroundColor = .clear
        passLabel.textColor = .white
        addSubview(passLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            coverImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            coverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            coverImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            coverImage.heightAnchor.constraint(equalToConstant: 200),
            
            userImage.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: -75),
            userImage.heightAnchor.constraint(equalToConstant: 125),
            userImage.widthAnchor.constraint(equalToConstant: 125),
            userImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            detailsView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 0),
            detailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailsView.heightAnchor.constraint(equalToConstant: 200),
            
            nameDescLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 50),
            nameDescLabel.heightAnchor.constraint(equalToConstant: 50),
            nameDescLabel.widthAnchor.constraint(equalToConstant: 70),
            nameDescLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 50),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: nameDescLabel.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -20),
            
            emailDescLabel.topAnchor.constraint(equalTo: nameDescLabel.bottomAnchor, constant: 30),
            emailDescLabel.heightAnchor.constraint(equalToConstant: 50),
            emailDescLabel.widthAnchor.constraint(equalToConstant: 70),
            emailDescLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: nameDescLabel.bottomAnchor, constant: 30),
            emailLabel.heightAnchor.constraint(equalToConstant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: emailDescLabel.trailingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -20),
            
            passDescLabel.topAnchor.constraint(equalTo: emailDescLabel.bottomAnchor, constant: 30),
            passDescLabel.heightAnchor.constraint(equalToConstant: 50),
            passDescLabel.widthAnchor.constraint(equalToConstant: 100),
            passDescLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 20),
            
            passLabel.topAnchor.constraint(equalTo: emailDescLabel.bottomAnchor, constant: 30),
            passLabel.heightAnchor.constraint(equalToConstant: 50),
            passLabel.leadingAnchor.constraint(equalTo: passDescLabel.trailingAnchor, constant: 20),
            passLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -20),
            
            changeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.widthAnchor.constraint(equalToConstant: 200),
            changeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
        ])
    }
    
    func setupUserDetails(name: String, email: String, pass: String) {
        nameLabel.text = name
        emailLabel.text = email
        passLabel.text = pass
    }
    
    @objc func changeButtonTapped() {
        print("change tapped")
        let user = User(name: nameLabel.text ?? "", email: emailLabel.text ?? "", password: passLabel.text ?? "")
        onChangeTapped?(user)
    }
}


extension UIImageView {

    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
