//
//  HomeViewController.swift
//  Meditation
//
//  Created by Aleksandr on 13/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, VerticalHomeViewCellDelegate {
    
    let topImage = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func didPressStartButton() {
        let courseDetailsViewController = CourseDetailsViewController()
        courseDetailsViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(courseDetailsViewController, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(topImage)
        topImage.translatesAutoresizingMaskIntoConstraints = false
        topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.image = UIImage(named: "Group 17")
        topImage.contentMode = .scaleToFill
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 40).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        titleLabel.text = "Good Morning, User"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        view.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        subTitleLabel.text = "We Wish you have a good day"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = .white
        collectionView.register(VerticalHomeViewCell.self, forCellWithReuseIdentifier: "VerticalHomeViewCell")
        collectionView.register(HorizontalHomeViewCell.self, forCellWithReuseIdentifier: "HorizontalHomeViewCell")
        collectionView.register(VerticalScrollHomeViewCell.self, forCellWithReuseIdentifier: "VerticalScrollHomeViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let verticalHomeViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalHomeViewCell", for: indexPath) as! VerticalHomeViewCell
            verticalHomeViewCell.position = .left
            verticalHomeViewCell.delegate = self
            return verticalHomeViewCell
        } else if indexPath.row == 1 {
            let verticalHomeViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalHomeViewCell", for: indexPath) as! VerticalHomeViewCell
            verticalHomeViewCell.position = .right
            verticalHomeViewCell.delegate = self
            return verticalHomeViewCell
        } else if indexPath.row == 2 {
            let horizontalHomeViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalHomeViewCell", for: indexPath) as! HorizontalHomeViewCell
            return horizontalHomeViewCell
        } else {
            let verticalScrollHomeViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalScrollHomeViewCell", for: indexPath) as! VerticalScrollHomeViewCell
            return verticalScrollHomeViewCell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 || indexPath.row == 1 {
            return CGSize(width: collectionView.bounds.width / 2, height: 210 + 16)
        }
        if indexPath.row == 2 {
            return CGSize(width: collectionView.bounds.width, height: 95 + 20)
        }
        return CGSize(width: collectionView.bounds.width, height: 247)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
