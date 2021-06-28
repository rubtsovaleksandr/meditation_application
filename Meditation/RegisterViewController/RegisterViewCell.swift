//
//  RegisterViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 17/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

protocol RegisterViewCellDelegate: class {
    func didPressStartedButton(name: String, email: String, pass: String)
}

class RegisterViewCell: UICollectionViewCell {
    
    weak var delegate: RegisterViewCellDelegate?
    
    let facebookColor = UIColor(red: 117 / 255, green: 131 / 255, blue: 202 / 255, alpha: 1)
    let textfieldColor = UIColor(red: 242 / 255, green: 243 / 255, blue: 247 / 255, alpha: 1)
    let colorButton = UIColor(red: 142 / 255, green: 151 / 255, blue: 253 / 255, alpha: 1)
    
    let createLabel = UILabel()
    let faceBookButton = SocialMediaButton()
    let googleButton = SocialMediaButton()
    let emailLabel = UILabel()
    let nameTextField = CustomTextField()
    let emailTextField = CustomTextField()
    let passwordTextField = CustomTextField()
    let privacePoliceLabel = UILabel()
    let control = UIControl()
    let startedButton = UIButton()
    
    var isAddButton = Bool()

    var dateNameTextField = String()
    var dateEmailTextField = String()
    var datePasswordTextField = String()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        registerView()
    }
    
    func registerView() {
        contentView.addSubview(createLabel)
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        createLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        createLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        createLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        createLabel.text = "Create your account"
        createLabel.textColor = .black
        createLabel.textAlignment = .center
        createLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        contentView.addSubview(faceBookButton)
        faceBookButton.translatesAutoresizingMaskIntoConstraints = false
        faceBookButton.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        faceBookButton.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 20).isActive = true
        faceBookButton.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        faceBookButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        faceBookButton.layer.cornerRadius = 32
        faceBookButton.backgroundColor = facebookColor
        faceBookButton.socialMediaLabel.text = "CONTINUE WITH FACEBOOK"
        faceBookButton.socialMediaImage.image = UIImage(named: "VectorFB")
        
        contentView.addSubview(googleButton)
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        googleButton.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 16).isActive = true
        googleButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        googleButton.layer.cornerRadius = 32
        googleButton.layer.borderWidth = 1
        googleButton.layer.borderColor = UIColor.lightGray.cgColor
        googleButton.backgroundColor = .white
        googleButton.socialMediaLabel.text = "CONTINUE WITH GOOGLE"
        googleButton.socialMediaLabel.textColor = .black
        googleButton.socialMediaImage.image = UIImage(named: "Group 6795")
        
        contentView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        emailLabel.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 20).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        emailLabel.text = "OR LOG IN WITH EMAIL"
        emailLabel.textColor = .lightGray
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        contentView.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        nameTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 63).isActive = true
        nameTextField.layer.cornerRadius = 15
        nameTextField.backgroundColor = textfieldColor
        nameTextField.attributedPlaceholder = NSAttributedString(string: "User name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        nameTextField.text = ""
        nameTextField.textColor = .black
        nameTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        nameTextField.returnKeyType = .continue
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(nameTextFieldChanged), for: .editingChanged)
        
        contentView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 63).isActive = true
        emailTextField.layer.cornerRadius = 15
        emailTextField.backgroundColor = textfieldColor
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.text = ""
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        emailTextField.returnKeyType = .continue
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        
        contentView.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 63).isActive = true
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.backgroundColor = textfieldColor
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.text = ""
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        
        contentView.addSubview(privacePoliceLabel)
        privacePoliceLabel.translatesAutoresizingMaskIntoConstraints = false
        privacePoliceLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        privacePoliceLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24).isActive = true
        privacePoliceLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        privacePoliceLabel.text = "i have read the Privace Police"
        privacePoliceLabel.textColor = .lightGray
        privacePoliceLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(control)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24).isActive = true
        control.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        control.widthAnchor.constraint(equalToConstant: 24).isActive = true
        control.heightAnchor.constraint(equalToConstant: 24).isActive = true
        control.layer.borderWidth = 3
        control.layer.borderColor = UIColor.gray.cgColor
        control.addTarget(self, action: #selector(controlTouchUpInside), for: .touchUpInside)
        control.backgroundColor = .white
        
        contentView.addSubview(startedButton)
        startedButton.translatesAutoresizingMaskIntoConstraints = false
        startedButton.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        startedButton.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        startedButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        startedButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        startedButton.setTitle("GET STARTED", for: .normal)
        startedButton.backgroundColor = colorButton
        startedButton.layer.cornerRadius = 32
        startedButton.addTarget(self, action: #selector(startedButtonTouchUpInside), for: .touchUpInside)
        
    }
    
    @objc
    func controlTouchUpInside(_ button: UIButton) {
        if isAddButton == false {
            control.backgroundColor = colorButton
            isAddButton = true
        } else {
            isAddButton = false
            control.backgroundColor = .white
        }
    }
    
    @objc
    func startedButtonTouchUpInside() {
        if dateNameTextField.isEmpty {
            nameTextField.becomeFirstResponder()
            return
        } else if dateEmailTextField.isEmpty {
            emailTextField.becomeFirstResponder()
            return
        } else if datePasswordTextField.isEmpty {
            passwordTextField.becomeFirstResponder()
            return
        }
        delegate?.didPressStartedButton(name: dateNameTextField, email: dateEmailTextField, pass: datePasswordTextField)
    }
    
    @objc
    func nameTextFieldChanged() {
        dateNameTextField = nameTextField.text ?? ""
        //UserDefaults.standard.set(dateNameTextField, forKey: "Name")
    }
    
    @objc
    func emailTextFieldChanged() {
        dateEmailTextField = emailTextField.text ?? ""
        //UserDefaults.standard.set(dateEmailTextField, forKey: "Email")
    }
    
    @objc
    func passwordTextFieldChanged() {
        datePasswordTextField = passwordTextField.text ?? ""
        //UserDefaults.standard.set(datePasswordTextField, forKey: "Password")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SocialMediaButtonRV: UIControl {
    
    let socialMediaImage = UIImageView()
    let socialMediaLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(socialMediaImage)
        socialMediaImage.translatesAutoresizingMaskIntoConstraints = false
        socialMediaImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 26).isActive = true
        socialMediaImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        socialMediaImage.image = UIImage()
        
        addSubview(socialMediaLabel)
        socialMediaLabel.translatesAutoresizingMaskIntoConstraints = false
        socialMediaLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        socialMediaLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        socialMediaLabel.text = ""
        socialMediaLabel.textColor = .white
        socialMediaLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTextFieldRV: UITextField {
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + 20, y: bounds.minY, width: bounds.width - 40, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + 20, y: bounds.minY, width: bounds.width - 40, height: bounds.height)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + 20, y: bounds.minY, width: bounds.width - 40, height: bounds.height)
    }
}

extension RegisterViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        }
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}
