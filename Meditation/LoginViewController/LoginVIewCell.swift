//
//  LoginVIewCell.swift
//  Meditation
//
//  Created by Aleksandr on 17/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

protocol LoginViewCellDelegate: class {
    func didPressSingUpLabel()
    func didPressLogInButton()
}

class LoginVIewCell: UICollectionViewCell {
    
    weak var delegate: LoginViewCellDelegate?
    
    let facebookColor = UIColor(red: 117 / 255, green: 131 / 255, blue: 202 / 255, alpha: 1)
    let textfieldColor = UIColor(red: 242 / 255, green: 243 / 255, blue: 247 / 255, alpha: 1)
    let colorButton = UIColor(red: 142 / 255, green: 151 / 255, blue: 253 / 255, alpha: 1)
    
    let welcomeLabel = UILabel()
    let facebookButton = SocialMediaButton()
    let googleButton = SocialMediaButton()
    let emailLabel = UILabel()
    
    let emailTextField = CustomTextField()
    let passwordTextField = CustomTextField()
    let logInButton = UIButton()
    let forgotLabel = UILabel()
    let singUpLabel = UILabel()
    
    var dateEmailTextField = String()
    var datePasswordTextField = String()
    
    var registerViewController = RegisterViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loginView()
    }
    
    func loginView() {
        
        contentView.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        welcomeLabel.text = "Welcome Back"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        contentView.addSubview(facebookButton)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        facebookButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20).isActive = true
        facebookButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        facebookButton.layer.cornerRadius = 32
        facebookButton.backgroundColor = facebookColor
        facebookButton.socialMediaLabel.text = "CONTINUE WITH FACEBOOK"
        facebookButton.socialMediaImage.image = UIImage(named: "VectorFB")
        
        contentView.addSubview(googleButton)
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        googleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 16).isActive = true
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
        
        contentView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40).isActive = true
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
        emailTextField.addTarget(self, action: #selector(emailTextFieldEditingChanged), for: .editingChanged)
        
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
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldEditingChanged), for: .editingChanged)
        
        contentView.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        logInButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        logInButton.setTitle("LOG IN", for: .normal)
        logInButton.backgroundColor = colorButton
        logInButton.layer.cornerRadius = 32
        logInButton.addTarget(self, action: #selector(logInButtonTouchUpInside), for: .touchUpInside)
        
        contentView.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        forgotLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20).isActive = true
        forgotLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        forgotLabel.text = "Forgot Password?"
        forgotLabel.textColor = .black
        forgotLabel.textAlignment = .center
        forgotLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(singUpLabel)
        singUpLabel.translatesAutoresizingMaskIntoConstraints = false
        singUpLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        singUpLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        singUpLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -46).isActive = true
        singUpLabel.text = "ALREADY HAVE AN ACCOUNT? SING UP"
        singUpLabel.textColor = .lightGray
        singUpLabel.textAlignment = .center
        singUpLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        singUpLabel.isUserInteractionEnabled = true
        singUpLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSingUpLabel)))
        
        let singUpLabelAttrebutedText = NSMutableAttributedString(string: "ALREADY HAVE AN ACCOUNT? ", attributes:[.font: UIFont.systemFont(ofSize: 14, weight: .medium), .foregroundColor: UIColor.lightGray])
        singUpLabelAttrebutedText.append(NSAttributedString(string: "SING UP", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium), .foregroundColor: UIColor.blue]))
        
        singUpLabel.attributedText = singUpLabelAttrebutedText
    }
    @objc
    func emailTextFieldEditingChanged() {
        dateEmailTextField = emailTextField.text ?? ""
        
    }
    @objc
    func passwordTextFieldEditingChanged() {
        datePasswordTextField = passwordTextField.text ?? ""
        
    }
    
    @objc
    func tapSingUpLabel() {
        delegate?.didPressSingUpLabel()
    }
    
    @objc
    func logInButtonTouchUpInside() {
        
        if dateEmailTextField.isEmpty {
            emailTextField.becomeFirstResponder()
            return
        }
        if VerificationUsersEmail() == false {
            return
        }
        
        if datePasswordTextField.isEmpty {
            passwordTextField.becomeFirstResponder()
            return
        }
        
        if VerificetionUsersPassword() == false {
            return
        }
        
        delegate?.didPressLogInButton()
    }
    
    func VerificationUsersEmail() -> Bool {
        let array = UserDefaults.standard.array(forKey: "Email")
        for i in array ?? [] {
            let ii = i as? String
        if ii == dateEmailTextField {
            return true
        } else {
            emailTextField.clearsOnBeginEditing = true
            emailTextField.becomeFirstResponder()
            continue
            }
        }
        return false
    }
    
    func VerificetionUsersPassword() -> Bool {
        let array = UserDefaults.standard.array(forKey: "Password")
        for i in array ?? [] {
            let ii = i as? String
        if ii == datePasswordTextField {
            return true
        } else {
            passwordTextField.clearsOnBeginEditing = true
            passwordTextField.becomeFirstResponder()
            continue
            }
        }
        return false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SocialMediaButton: UIControl {
    
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

class CustomTextField: UITextField {
    
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

extension LoginVIewCell: UITextFieldDelegate {
    // Данный параметр показывает на каком тексфилде произошло нажатие на кнопку return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}
