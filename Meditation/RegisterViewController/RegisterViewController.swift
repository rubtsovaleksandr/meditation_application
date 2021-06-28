//
//  RegisterViewController.swift
//  Meditation
//
//  Created by Aleksandr on 16/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewCellDelegate {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var nameArray: [String] = []
    var emailArray: [String] = []
    var passwordArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
        registerForKeyboardNotifications()
    }
    
    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
           navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Group 6792")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(pressLeftBarButtonItem))
       }
       
    @objc
    func pressLeftBarButtonItem() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.backgroundColor = .white
        collectionView.register(RegisterViewCell.self, forCellWithReuseIdentifier: "RegisterViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let valueRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = valueRect.cgRectValue.height
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
    
    @objc
    func keyboardWillHide() {
        collectionView.contentInset = .zero
        collectionView.scrollIndicatorInsets = .zero
    }
    
    func didPressStartedButton(name: String, email: String, pass: String) {
        
        nameArray = UserDefaults.standard.array(forKey: "Name") as? [String] ?? []
        nameArray.append(name)
        UserDefaults.standard.set(nameArray, forKey: "Name")
        print(nameArray)
        
        emailArray = UserDefaults.standard.array(forKey: "Email") as? [String] ?? []
        emailArray.append(email)
        UserDefaults.standard.set(emailArray, forKey: "Email")
        print(emailArray)
        
        passwordArray = UserDefaults.standard.array(forKey: "Password") as? [String] ?? []
        passwordArray.append(pass)
        UserDefaults.standard.set(passwordArray, forKey: "Password")
        print(passwordArray)
        
        let getStartedViewController = GetStartedViewController()
        navigationController?.pushViewController(getStartedViewController, animated: true)
        
    }
}

extension RegisterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegisterViewCell", for: indexPath) as! RegisterViewCell
        cell.delegate = self
        return cell
    }
}

extension RegisterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let titleHeight = "Create your account".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 28, weight: .bold))
        let titleHeight2 = "OR LOG IN WITH EMAIL".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 14, weight: .bold))
        let titleHeight3 = "i have read the Privace Police".heightWithConstrainedWidth(collectionView.bounds.width - 32, font: UIFont.systemFont(ofSize: 14, weight: .medium))
        let height: CGFloat = 20 + titleHeight + 20 + 63 + 16 + 63 + 20 + titleHeight2 + 40 + 63 + 20 + 63 + 20 + 63 + 24 + titleHeight3 + 32 + 63 + 70
        return CGSize(width: collectionView.bounds.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
