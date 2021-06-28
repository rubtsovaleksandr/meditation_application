//
//  GetStartedVIewController.swift
//  Meditation
//
//  Created by Aleksandr on 16/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    let viewColor = UIColor(red: 140 / 255, green: 150 / 255, blue: 255 / 255, alpha: 1)
    let getStartedButtonColor = UIColor(red: 235 / 255, green: 234 / 255, blue: 236 / 255, alpha: 1)
    
    let silentMoonImage = UIImageView()
    let welcomeLabel = UILabel()
    let toSilentMoonLabel = UILabel()
    let descriptionAppLabel = UILabel()
    let girlImage = UIImageView()
    let getStartedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = viewColor
        
        view.addSubview(silentMoonImage)
        silentMoonImage.translatesAutoresizingMaskIntoConstraints = false
        silentMoonImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        silentMoonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        silentMoonImage.image = UIImage(named: "Group 17")
        silentMoonImage.contentMode = .scaleToFill
        
        view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: silentMoonImage.bottomAnchor, constant: 75).isActive = true
        welcomeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        welcomeLabel.text = "Hi User, Welcome"
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        view.addSubview(toSilentMoonLabel)
        toSilentMoonLabel.translatesAutoresizingMaskIntoConstraints = false
        toSilentMoonLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        toSilentMoonLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10).isActive = true
        toSilentMoonLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        toSilentMoonLabel.text = "to Silent Moon"
        toSilentMoonLabel.textColor = .white
        toSilentMoonLabel.textAlignment = .center
        toSilentMoonLabel.font = UIFont.systemFont(ofSize: 30, weight: .light)
        
        view.addSubview(descriptionAppLabel)
        descriptionAppLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionAppLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        descriptionAppLabel.topAnchor.constraint(equalTo: toSilentMoonLabel.bottomAnchor, constant: 15).isActive = true
        descriptionAppLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        descriptionAppLabel.text = "Explore the app, Find some peace of mind to prepare for meditation."
        descriptionAppLabel.textColor = .white
        descriptionAppLabel.textAlignment = .center
        descriptionAppLabel.numberOfLines = 2
        descriptionAppLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        view.addSubview(girlImage)
        girlImage.translatesAutoresizingMaskIntoConstraints = false
        girlImage.topAnchor.constraint(equalTo: descriptionAppLabel.bottomAnchor, constant: 96).isActive = true
        girlImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        girlImage.image = UIImage(named: "GroupGS")
        girlImage.contentMode = .scaleToFill
        
        view.addSubview(getStartedButton)
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        getStartedButton.topAnchor.constraint(equalTo: girlImage.bottomAnchor, constant: 84).isActive = true
        getStartedButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        getStartedButton.backgroundColor = getStartedButtonColor
        getStartedButton.setTitle("GET STARTED", for: .normal)
        getStartedButton.setTitleColor(.black, for: .normal)
        getStartedButton.layer.cornerRadius = 32
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTouchUpInside), for: .touchUpInside)
        
    }
    
    @objc
    func getStartedButtonTouchUpInside() {
        let chooseTopicViewController = ChooseTopicViewController()
        navigationController?.pushViewController(chooseTopicViewController, animated: true)
    }
}
