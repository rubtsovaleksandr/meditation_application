//
//  StartViewController.swift
//  Meditation
//
//  Created by Aleksandr on 16/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    let colorView = UIColor(red: 250 / 255, green: 248 / 255, blue: 245 / 255, alpha: 1)
    let colorButton = UIColor(red: 142 / 255, green: 151 / 255, blue: 253 / 255, alpha: 1)
    
    let imageView = UIImageView()
    let centerImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let loginLabel = UILabel()
    let singUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorView
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.image = UIImage(named: "Group 17")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(centerImageView)
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        centerImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        centerImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        centerImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        centerImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        centerImageView.image = UIImage(named: "Group")
        centerImageView.contentMode = .scaleToFill
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: centerImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.text = "We are what we do"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        
        view.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        subTitleLabel.text = "Thousand of people are usign silent moon for smalls meditation"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        subTitleLabel.numberOfLines = 2
        
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        loginLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        loginLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        loginLabel.text = "ALREADY HAVE AN ACCOUNT? LOG IN"
        loginLabel.textColor = .lightGray
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLoginLabel)))
        
        let loginLabelAttributedText = NSMutableAttributedString(string: "ALREADY HAVE AN ACCOUNT? ", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium), .foregroundColor: UIColor.lightGray])
        loginLabelAttributedText.append(NSAttributedString(string: "LOG IN", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium), .foregroundColor: UIColor.blue]))
        
        loginLabel.attributedText = loginLabelAttributedText
        
        view.addSubview(singUpButton)
        singUpButton.translatesAutoresizingMaskIntoConstraints = false
        singUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        singUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        singUpButton.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -10).isActive = true
        singUpButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        singUpButton.setTitle("SING UP", for: .normal)
        singUpButton.backgroundColor = colorButton
        singUpButton.layer.cornerRadius = 32
        singUpButton.addTarget(self, action: #selector(singUpButtonTouchUpInside), for: .touchUpInside)
        
    }
    
    @objc
    func singUpButtonTouchUpInside() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @objc
    func tapLoginLabel() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
