//
//  LoginViewController.swift
//  Meditation
//
//  Created by Aleksandr on 16/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewCellDelegate {
     
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavigationBar()
        registerForKeyboardNotifications()
    }
    
    func didPressSingUpLabel() {
        
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    func didPressLogInButton() {
        let getStartedViewController = GetStartedViewController()
        navigationController?.pushViewController(getStartedViewController, animated: true)
    }
   
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.register(LoginVIewCell.self, forCellWithReuseIdentifier: "LoginVIewCell")
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Group 6792")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(pressLeftBarButtonItem))
    }
    @objc
       func pressLeftBarButtonItem() {
           navigationController?.popViewController(animated: true)
       }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWasShown(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let valueRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = valueRect.cgRectValue.height
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
    
    @objc
    func keyboardWillBeHidden() {
        collectionView.contentInset = .zero
        collectionView.scrollIndicatorInsets = .zero
    }
}

extension LoginViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoginVIewCell", for: indexPath) as! LoginVIewCell
        cell.delegate = self
        
        return cell
    }
}

extension LoginViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let titleHeight = "Welcome Back".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 28, weight: .bold))
        let titleHeight2 = "OR LOG IN WITH EMAIL".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 14, weight: .bold))
        let titleHeight3 = "Forgot Password?".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 14, weight: .medium))
        let titleHeight4 = "ALREADY HAVE AN ACCOUNT? SING UP".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 14, weight: .medium))
        let height: CGFloat = 20 + titleHeight + 20 + 63 + 16 + 63 + 20 + titleHeight2 + 40 + 63 + 20 + 63 + 30 + 63 + 20 + titleHeight3 + 104 + titleHeight4 + 46
        return CGSize(width: collectionView.bounds.width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
