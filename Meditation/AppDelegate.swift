//
//  AppDelegate.swift
//  Meditation
//
//  Created by Aleksandr on 12/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var user = UserDefaults.standard.string(forKey: "Email")
    
    var isAuth: Bool?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
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
        
        let startViewController = StartViewController()
        
        let navigationController = UINavigationController(rootViewController: startViewController)
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.view.backgroundColor = .blue
        
        window = UIWindow()
        
        if user != nil {
            let navigationController = UINavigationController(rootViewController: tabBarViewController)
            isAuth = false
            window?.rootViewController = navigationController
        } else {
            isAuth = true
            window?.rootViewController = navigationController
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }

}
