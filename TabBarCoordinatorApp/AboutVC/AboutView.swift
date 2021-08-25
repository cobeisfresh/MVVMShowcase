//
//  AboutView.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 24.08.2021..
//

import Foundation
import UIKit

class AboutView: UIView {
    //MARK: - Outlets
    private lazy var backgroundImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionBackgroundView = UIView()
    private lazy var textView = UITextView()
    private lazy var logoutButton = UIButton()
    
    var viewModel: AboutViewModel!
    var onLogoutTapped: (()->Void)?
    
    
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
        backgroundColor = .orange
        
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        descriptionBackgroundView.backgroundColor = .white.withAlphaComponent(0.3)
        descriptionBackgroundView.layer.cornerRadius = 25
        addSubview(descriptionBackgroundView)
        
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "systemFont", size: 18)
        textView.tintColor = .white
        textView.text = "\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae fringilla velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in feugiat nisl. Phasellus egestas quam ut metus accumsan rutrum. Donec placerat elit vel ex aliquet, eu consectetur mi laoreet. Suspendisse luctus, libero et mollis fringilla, neque orci rhoncus nisl, eu volutpat leo dui quis est. Vivamus cursus dapibus lacus sagittis sollicitudin. \n\nCurabitur a cursus velit. Integer id magna sed urna sodales finibus. Nam sed urna semper, posuere felis id, aliquam mi. Integer commodo consequat finibus. Donec sed mi vel metus efficitur faucibus interdum eu ex. Maecenas fermentum magna eget mattis tincidunt. Morbi imperdiet sem at mi tincidunt dictum. Vestibulum viverra porttitor ex in dignissim. Praesent at consequat velit, eget egestas arcu. Donec eu ipsum dictum, ullamcorper turpis sit amet, placerat tortor. \n\nSuspendisse id odio neque. Suspendisse dictum enim at fermentum imperdiet. Curabitur purus nibh, varius id lorem id, tristique bibendum arcu. Phasellus nec aliquet tortor. Nulla ligula est, feugiat ut tempor eget, ornare gravida est. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Aliquam pharetra, massa sed scelerisque iaculis, tellus nisi iaculis justo, sit amet egestas quam quam vitae erat. \n\nSuspendisse faucibus mi eu neque mattis suscipit ut vitae purus. Quisque sed vestibulum magna. Nullam sed iaculis ipsum. Quisque laoreet odio ac mi tempus varius. Donec sed maximus mi. Aenean non nunc purus. Proin ut magna efficitur, elementum tortor vel, luctus felis. Nam ultrices, urna eget ullamcorper laoreet, dolor massa scelerisque diam, vitae porta erat purus at purus. Vestibulum fermentum, risus ut malesuada dapibus, nisl nulla rhoncus odio, in pulvinar sem turpis a enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent pulvinar non risus sit amet commodo. Nullam eu felis semper, posuere est sit amet, sollicitudin sem. \n\nDonec posuere malesuada augue et consequat. Pellentesque vulputate, nulla at euismod interdum, lectus justo consectetur mauris, vitae rutrum purus ligula a est. Aliquam eleifend neque et augue aliquam condimentum. Phasellus cursus aliquam enim, ac volutpat enim. Proin eu ex vitae sem condimentum blandit. Phasellus eleifend sollicitudin elit quis aliquet. Ut non maximus magna. Donec efficitur, felis eu pulvinar convallis, nibh felis maximus felis, tempus suscipit nunc nulla at enim."
        descriptionBackgroundView.addSubview(textView)
        
        logoutButton.backgroundColor = .white
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.black.cgColor
        logoutButton.layer.masksToBounds = true
        logoutButton.layer.cornerRadius = 25
        logoutButton.clipsToBounds = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        logoutButton.setTitleColor(UIColor.black, for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.useAndActivateConstraints(constraints: [
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            descriptionBackgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            descriptionBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descriptionBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            descriptionBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            
            textView.topAnchor.constraint(equalTo: descriptionBackgroundView.topAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: descriptionBackgroundView.bottomAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: descriptionBackgroundView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: descriptionBackgroundView.trailingAnchor, constant: -10),
            
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.widthAnchor.constraint(equalToConstant: 50),
            logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
        ])
    }
    
    func setupUserDetails(with user: User) {
        self.titleLabel.text = "Hello, \(user.name)"
        
    }
    
    @objc func logoutButtonTapped() {
        onLogoutTapped?()
    }
}
