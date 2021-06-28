//
//  ViewController.swift
//  Meditation
//
//  Created by Aleksandr on 12/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let numberInRow = 3
    
    let colorView = UIColor(red: 30 / 255, green: 37 / 255, blue: 94 / 255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorView
        navigationItem.title = "Sleep Music"
        
        setupView()
    }

    func setupView() {
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.backgroundColor = colorView
        collectionView.register(SleepMusicCell.self, forCellWithReuseIdentifier: "SleepMusicCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SleepMusicCell", for: indexPath) as! SleepMusicCell
        cell.backgroundColor = colorView
        if indexPath.row % 2 == 0 {
            cell.position = .left
        }
        if indexPath.row % 2 == 1 {
            cell.position = .right
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let cellWidth = width / 2
//        var position: CollectionCellPosition = .left
//        if indexPath.row % 2 == 1 {
//            position = .right
//        }
        let constrainedWidth = cellWidth - 24
        
        let titleHight = "Night Island".heightWithConstrainedWidth(constrainedWidth, font: UIFont.systemFont(ofSize: 18, weight: .bold))
        let titleHight1 = "45 MIN ' SLEEP MUSIC".heightWithConstrainedWidth(constrainedWidth, font: UIFont.systemFont(ofSize: 11, weight: .medium))
        let height: CGFloat = 10 + 2 / 3 * cellWidth + 10 + titleHight + 6 + titleHight1
        
        
        return CGSize(width: width / 2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondSleepViewController = SecondSleepViewController()
        secondSleepViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(secondSleepViewController, animated: true)
    }
}

extension String {
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
