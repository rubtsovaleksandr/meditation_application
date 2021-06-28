//
//  UserViewController.swift
//  Meditation
//
//  Created by Aleksandr on 13/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    let logOutButton = UIButton()
    let textButton = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logOutButton)
        view.addSubview(textButton)
        
        view.backgroundColor = .white
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        logOutButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        logOutButton.layer.cornerRadius = 40
        logOutButton.backgroundColor = .gray
        logOutButton.addTarget(self, action: #selector(LogOutButtonTouchUpInside), for: .touchUpInside)
        
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.centerXAnchor.constraint(equalTo: logOutButton.centerXAnchor).isActive = true
        textButton.centerYAnchor.constraint(equalTo: logOutButton.centerYAnchor).isActive = true
        textButton.text = "LOGOUT"
        textButton.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textButton.textColor = .white
        
    }
    
    
    
    @objc
    func LogOutButtonTouchUpInside () {
        
        let startViewController = StartViewController()
        navigationController?.tabBarController?.navigationController?.setViewControllers([startViewController], animated: true)
        navigationController?.setToolbarHidden(true, animated: true)
    }
  
}
