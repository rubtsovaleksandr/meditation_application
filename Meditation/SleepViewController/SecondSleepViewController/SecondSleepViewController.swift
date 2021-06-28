//
//  SecondSleepViewController.swift
//  Meditation
//
//  Created by Aleksandr on 13/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class SecondSleepViewController: UIViewController {
    
    let colorView = UIColor(red: 30 / 255, green: 37 / 255, blue: 94 / 255, alpha: 1)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Group 6792"), style: .plain, target: self, action: #selector(pressLeftBarButtonItem) )
        
        view.backgroundColor = colorView
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = colorView
        collectionView.register(HeadingSleepCell.self, forCellWithReuseIdentifier: "HeadingSleepCell")
        collectionView.register(InfoSleepCell.self, forCellWithReuseIdentifier: "InfoSleepCell")
        collectionView.register(RelatedSleepCell.self, forCellWithReuseIdentifier: "RelatedSleepCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    @objc
    func pressLeftBarButtonItem() {
        navigationController?.popViewController(animated: true)
    }
}

extension SecondSleepViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
           let headingSleepCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadingSleepCell", for: indexPath) as! HeadingSleepCell
            return headingSleepCell
        } else if indexPath.row == 1 {
            let infoSleepCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoSleepCell", for: indexPath) as! InfoSleepCell
            return infoSleepCell
        } else {
            let relatedSleepCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedSleepCell", for: indexPath) as! RelatedSleepCell
            return relatedSleepCell
        }
    }
}
extension SecondSleepViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 290)
        } else {
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 240)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
