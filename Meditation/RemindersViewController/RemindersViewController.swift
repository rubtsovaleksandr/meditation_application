//
//  RemindersViewController.swift
//  Meditation
//
//  Created by Aleksandr on 18/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class RemindersViewController: UIViewController {
    
    let pickerColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 229 / 255, alpha: 1)
    let weaksButtonColor = UIColor(red: 63 / 255, green: 65 / 255, blue: 78 / 255, alpha: 1)
    let colorSaveButton = UIColor(red: 142 / 255, green: 151 / 255, blue: 253 / 255, alpha: 1)
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let secondTitleLabel = UILabel()
    let secondSubTitleLabel = UILabel()
    
    var days: [Bool] = [false, false, false, false, false, false, false]
    
    let weaksSUButton = CustomButton()
    let weaksMButton = CustomButton()
    let weaksTButton = CustomButton()
    let weaksWButton = CustomButton()
    let weaksTHButton = CustomButton()
    let weaksFButton = CustomButton()
    let weaksSButton = CustomButton()
    
    lazy var weaksButtons: [CustomButton] = [weaksSUButton, weaksMButton, weaksTButton, weaksWButton, weaksTHButton, weaksFButton, weaksSButton]
    
    let saveButton = UIButton()
    let noSafeButton = UIButton()
    
    var picker = UIDatePicker()
    
    var datePicker = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 76).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        titleLabel.text = "What time would you \nlike to meditate?"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.numberOfLines = 2
        
        view.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        subTitleLabel.text = "Any time you can choose but We recommend first thing in the morning."
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        subTitleLabel.numberOfLines = 2
        
        view.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        picker.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30).isActive = true
        picker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        picker.datePickerMode = .time
        picker.backgroundColor = pickerColor
        picker.layer.cornerRadius = 20
        picker.layer.masksToBounds = true
        picker.addTarget(self, action: #selector(pickerChanged), for: .valueChanged)
        
        view.addSubview(secondTitleLabel)
        secondTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        secondTitleLabel.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 30).isActive = true
        secondTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        secondTitleLabel.text = "Which day would you \nlike to meditate?"
        secondTitleLabel.textAlignment = .left
        secondTitleLabel.textColor = .black
        secondTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        secondTitleLabel.numberOfLines = 2
        
        view.addSubview(secondSubTitleLabel)
        secondSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondSubTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        secondSubTitleLabel.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 15).isActive = true
        secondSubTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        secondSubTitleLabel.text = "Everyday is best, but we recommend picking at least five."
        secondSubTitleLabel.textAlignment = .left
        secondSubTitleLabel.textColor = .lightGray
        secondSubTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        secondSubTitleLabel.numberOfLines = 2
        
        view.addSubview(weaksSUButton)
        weaksSUButton.translatesAutoresizingMaskIntoConstraints = false
        weaksSUButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        weaksSUButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksSUButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksSUButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksSUButton.customButtonLabel.text = "SU"
        weaksSUButton.layer.cornerRadius = 20
        weaksSUButton.layer.masksToBounds = true
        weaksSUButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(weaksMButton)
        weaksMButton.translatesAutoresizingMaskIntoConstraints = false
        weaksMButton.leftAnchor.constraint(equalTo: weaksSUButton.rightAnchor, constant: 16).isActive = true
        weaksMButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksMButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksMButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksMButton.customButtonLabel.text = "M"
        weaksMButton.layer.cornerRadius = 20
        weaksMButton.layer.masksToBounds = true
        weaksMButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(weaksTButton)
        weaksTButton.translatesAutoresizingMaskIntoConstraints = false
        weaksTButton.leftAnchor.constraint(equalTo: weaksMButton.rightAnchor, constant: 16).isActive = true
        weaksTButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksTButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksTButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksTButton.customButtonLabel.text = "T"
        weaksTButton.layer.cornerRadius = 20
        weaksTButton.layer.masksToBounds = true
        weaksTButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(weaksWButton)
        weaksWButton.translatesAutoresizingMaskIntoConstraints = false
        weaksWButton.leftAnchor.constraint(equalTo: weaksTButton.rightAnchor, constant: 16).isActive = true
        weaksWButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksWButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksWButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksWButton.customButtonLabel.text = "W"
        weaksWButton.layer.cornerRadius = 20
        weaksWButton.layer.masksToBounds = true
        weaksWButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(weaksTHButton)
        weaksTHButton.translatesAutoresizingMaskIntoConstraints = false
        weaksTHButton.leftAnchor.constraint(equalTo: weaksWButton.rightAnchor, constant: 16).isActive = true
        weaksTHButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksTHButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksTHButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksTHButton.customButtonLabel.text = "TH"
        weaksTHButton.layer.cornerRadius = 20
        weaksTHButton.layer.masksToBounds = true
        weaksTHButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(weaksFButton)
        weaksFButton.translatesAutoresizingMaskIntoConstraints = false
        weaksFButton.leftAnchor.constraint(equalTo: weaksTHButton.rightAnchor, constant: 16).isActive = true
        weaksFButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksFButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksFButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksFButton.customButtonLabel.text = "F"
        weaksFButton.layer.cornerRadius = 20
        weaksFButton.layer.masksToBounds = true
        weaksFButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(weaksSButton)
        weaksSButton.translatesAutoresizingMaskIntoConstraints = false
        weaksSButton.leftAnchor.constraint(equalTo: weaksFButton.rightAnchor, constant: 16).isActive = true
        weaksSButton.topAnchor.constraint(equalTo: secondSubTitleLabel.bottomAnchor, constant: 40).isActive = true
        weaksSButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        weaksSButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weaksSButton.customButtonLabel.text = "S"
        weaksSButton.layer.cornerRadius = 20
        weaksSButton.layer.masksToBounds = true
        weaksSButton.addTarget(self, action: #selector(weaksButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        saveButton.topAnchor.constraint(equalTo: weaksSButton.bottomAnchor, constant: 57).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.backgroundColor = colorSaveButton
        saveButton.layer.cornerRadius = 32
        saveButton.addTarget(self, action: #selector(saveButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(noSafeButton)
        noSafeButton.translatesAutoresizingMaskIntoConstraints = false
        noSafeButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20).isActive = true
        noSafeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noSafeButton.setTitle("NO THANKS", for: .normal)
        noSafeButton.setTitleColor(.black, for: .normal)
        noSafeButton.addTarget(self, action: #selector(saveButtonTouchUpInside), for: .touchUpInside)
    }
    
    @objc
    func weaksButtonTouchUpInside(sender: CustomButton) {
        guard let index = weaksButtons.firstIndex(of: sender) else { return }
        if days[index] == false {
            sender.customButtonLabel.backgroundColor = weaksButtonColor
            sender.customButtonLabel.textColor = .white
            days[index] = true
        } else {
            days[index] = false
            sender.customButtonLabel.backgroundColor = .white
            sender.customButtonLabel.textColor = .lightGray
        }
    }
    
    @objc
    func pickerChanged(sender: UIDatePicker) {
        sender.date = datePicker
    }
    
    @objc
    func saveButtonTouchUpInside() {
        
        let homeViewController = HomeViewController()
        let homeVC = UINavigationController(rootViewController: homeViewController)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Vector"), selectedImage: nil)
        let sleepViewController = ViewController()
        let sleepVC = UINavigationController(rootViewController: sleepViewController)
        sleepVC.tabBarItem = UITabBarItem(title: "Sleep", image: UIImage(named: "Vector1"), selectedImage: nil)
        let meditateViewController = MeditateViewController()
        let meditateVC = UINavigationController(rootViewController: meditateViewController)
        meditateVC.tabBarItem = UITabBarItem(title: "Meditate", image: UIImage(named: "Group2"), selectedImage: nil)
        let musicViewController = MusicViewController()
        let musicVC = UINavigationController(rootViewController: musicViewController)
        musicVC.tabBarItem = UITabBarItem(title: "Music", image: UIImage(named: "Group3"), selectedImage: nil)
        let userViewController = UserViewController()
        let userVC = UINavigationController(rootViewController: userViewController)
        userVC.tabBarItem = UITabBarItem(title: "User", image: UIImage(named: "Group4"), selectedImage: nil)
        
        let tabBarViewController = UITabBarController()
        tabBarViewController.setViewControllers([homeVC,sleepVC,meditateVC,musicVC,userVC], animated: true)
        
        navigationController?.setViewControllers([tabBarViewController], animated: true)
    }
}

class CustomButton: UIControl {
    
    let customButtonLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(customButtonLabel)
        customButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        customButtonLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        customButtonLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        customButtonLabel.text = ""
        customButtonLabel.textColor = .lightGray
        customButtonLabel.textAlignment = .center
        customButtonLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        customButtonLabel.layer.borderWidth = 2
        customButtonLabel.layer.borderColor = UIColor.gray.cgColor
        customButtonLabel.layer.cornerRadius = 20
        customButtonLabel.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
