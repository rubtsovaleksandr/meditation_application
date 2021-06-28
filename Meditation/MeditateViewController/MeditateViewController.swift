//
//  MeditateViewController.swift
//  Meditation
//
//  Created by Aleksandr on 13/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class MeditateViewController: UIViewController {
    
    let meditateScrollViewLayout = MeditateScrollViewLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: meditateScrollViewLayout)
    
    let items: [ScrollItem] = [ScrollItem(image: UIImage(named: "Group7Medit")!, title: "7 Days of Calm"),
    ScrollItem(image: UIImage(named: "MaskGroup2medit")!, title: "Anxiet Release"),
    ScrollItem(image: UIImage(named: "Mask Groupmeditate")!, title: "Very Good\n"),
    ScrollItem(image: UIImage(named: "MaskGroupmedit")!, title: "Super Puper"),
    ScrollItem(image: UIImage(named: "MaskGroup2medit")!, title: "Anxiet Release"),
    ScrollItem(image: UIImage(named: "Mask Groupmeditate")!, title: "Very Good\n"),
    ScrollItem(image: UIImage(named: "MaskGroupmedit")!, title: "Super Puper")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.register(MeditateViewCell.self, forCellWithReuseIdentifier: "MeditateViewCell")
        collectionView.register(IconsCollectionViewCell.self, forCellWithReuseIdentifier: "IconsCollectionViewCell")
        collectionView.register(DailyCalmCell.self, forCellWithReuseIdentifier: "DailyCalmCell")
        collectionView.register(SecondMeditateScrollViewCell.self, forCellWithReuseIdentifier: "SecondMeditateScrollViewCell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
    }
    
}

extension MeditateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 1
        }
        if section == 2 {
            return 1
        }
        if section == 3 {
            return items.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let meditateViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeditateViewCell", for: indexPath) as! MeditateViewCell
            return meditateViewCell
        } else if indexPath.section == 1 {
            let iconsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconsCollectionViewCell", for: indexPath) as! IconsCollectionViewCell
            return iconsCollectionViewCell
        } else if indexPath.section == 2 {
            let dailyCalmCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyCalmCell", for: indexPath) as! DailyCalmCell
            return dailyCalmCell
        } else {
            let secondMeditateScrollViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondMeditateScrollViewCell", for: indexPath) as! SecondMeditateScrollViewCell
            let item = items[indexPath.row]
            secondMeditateScrollViewCell.imageObject.image = item.image
            secondMeditateScrollViewCell.titleLabel.text = item.title
            return secondMeditateScrollViewCell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
}

