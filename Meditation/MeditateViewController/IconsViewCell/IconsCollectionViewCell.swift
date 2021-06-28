//
//  IconsCollectionViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 06/12/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class IconsCollectionViewCell: UICollectionViewCell, IconsScrollCellDelegate {
    
    var allButton: IndexPath = IndexPath(row: 0, section: 0)
    var oneButton: IndexPath = IndexPath(row: 1, section: 0)
    var twoButton: IndexPath = IndexPath(row: 2, section: 0)
    var threeButton: IndexPath = IndexPath(row: 3, section: 0)
    var fourButton: IndexPath = IndexPath(row: 4, section: 0)
    var pressButton: [IndexPath] = [IndexPath(row: 0, section: 0)]
    
    
    
    func didMoodButtonTouchUpInside(_ didMoodButtonTouchUpInside: IconsScrollCell) {
        
        guard let indexPath = collectionView.indexPath(for: didMoodButtonTouchUpInside) else { return }
        
        if pressButton.contains(indexPath) {
            
            if indexPath == allButton {
                let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                allCell.moodButton.backgroundColor = .blue
                let oneCell = collectionView.cellForItem(at: oneButton) as! IconsScrollCell
                oneCell.moodButton.backgroundColor = .gray
                let twoCell = collectionView.cellForItem(at: twoButton) as! IconsScrollCell
                twoCell.moodButton.backgroundColor = .gray
                let threeCell = collectionView.cellForItem(at: threeButton) as! IconsScrollCell
                threeCell.moodButton.backgroundColor = .gray
                let fourCell = collectionView.cellForItem(at: fourButton) as! IconsScrollCell
                fourCell.moodButton.backgroundColor = .gray
                pressButton.removeAll()
                pressButton.append(allButton)

            }
                
            if indexPath == oneButton || indexPath == twoButton || indexPath == threeButton || indexPath == fourButton {
                let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                allCell.moodButton.backgroundColor = .gray
            }

            if indexPath == oneButton {
                let oneCell = collectionView.cellForItem(at: oneButton) as! IconsScrollCell
                oneCell.moodButton.backgroundColor = .gray
                guard let i = pressButton.firstIndex(of: oneButton) else { return }
                pressButton.remove(at: i)
                if pressButton.count == 1 {
                    let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                    allCell.moodButton.backgroundColor = .blue
                }
            }

            if indexPath == twoButton {
                let twoCell = collectionView.cellForItem(at: twoButton) as! IconsScrollCell
                twoCell.moodButton.backgroundColor = .gray
                guard let i = pressButton.firstIndex(of: twoButton) else { return }
                pressButton.remove(at: i)
                if pressButton.count == 1 {
                    let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                    allCell.moodButton.backgroundColor = .blue
                    }
                }

            if indexPath == threeButton {
                let threeCell = collectionView.cellForItem(at: threeButton) as! IconsScrollCell
                threeCell.moodButton.backgroundColor = .gray
                guard let i = pressButton.firstIndex(of: threeButton) else { return }
                pressButton.remove(at: i)
                if pressButton.count == 1 {
                    let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                    allCell.moodButton.backgroundColor = .blue
                    }
                }
            if indexPath == fourButton {
                let fourCell = collectionView.cellForItem(at: fourButton) as! IconsScrollCell
                fourCell.moodButton.backgroundColor = .gray
                guard let i = pressButton.firstIndex(of: fourButton) else { return }
                pressButton.remove(at: i)
                if pressButton.count == 1 {
                    let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                    allCell.moodButton.backgroundColor = .blue
                }
            }

        } else {
            didMoodButtonTouchUpInside.moodButton.backgroundColor = .blue
            pressButton.append(indexPath)
            if oneButton == indexPath || twoButton == indexPath || threeButton == indexPath || fourButton == indexPath {
                let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                allCell.moodButton.backgroundColor = .gray
            }
            if indexPath == allButton {
                let allCell = collectionView.cellForItem(at: allButton) as! IconsScrollCell
                allCell.moodButton.backgroundColor = .blue
                let oneCell = collectionView.cellForItem(at: oneButton) as! IconsScrollCell
                oneCell.moodButton.backgroundColor = .gray
                let twoCell = collectionView.cellForItem(at: twoButton) as! IconsScrollCell
                twoCell.moodButton.backgroundColor = .gray
                let threeCell = collectionView.cellForItem(at: threeButton) as! IconsScrollCell
                threeCell.moodButton.backgroundColor = .gray
                let fourCell = collectionView.cellForItem(at: fourButton) as! IconsScrollCell
                fourCell.moodButton.backgroundColor = .gray
                pressButton.removeAll()
                pressButton.append(allButton)
            }
        }
    }
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        return collectionView
    }()
    
    let iconsItem: [IconsItem] = [IconsItem(icon: UIImage(named: "FrameMedit")!, titleIcon: "All", color: UIColor.blue),
                                  IconsItem(icon: UIImage(named: "Frame2icons")!, titleIcon: "My", color: UIColor.gray),
                                  IconsItem(icon: UIImage(named: "Frame3icons")!, titleIcon: "Anxious", color: UIColor.gray),
                                  IconsItem(icon: UIImage(named: "Frame4icons")!, titleIcon: "Sleep", color: UIColor.gray),
                                  IconsItem(icon: UIImage(named: "Group5icons")!, titleIcon: "Kids", color: UIColor.gray)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.register(IconsScrollCell.self, forCellWithReuseIdentifier: "IconsScrollCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconsCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconsScrollCell", for: indexPath) as! IconsScrollCell
        let item = iconsItem[indexPath.row]
        cell.moodButton.setImage(item.icon, for: .normal)
        cell.nameButton.text = item.titleIcon
        cell.moodButton.backgroundColor = item.color
        cell.delegate = self
        return cell
    }
}
    
extension IconsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 130)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

protocol IconsScrollCellDelegate: class {
    func didMoodButtonTouchUpInside(_ didMoodButtonTouchUpInside: IconsScrollCell)
}

class IconsScrollCell: UICollectionViewCell {
    
    weak var delegate: IconsScrollCellDelegate?
    
    let frameImage = UIImageView()
    let moodButton = UIButton()
    let nameButton = UILabel()
    let buttonColor = UIColor(displayP3Red: 142 / 255, green: 151 / 255, blue: 253 / 255, alpha: 1)
    var addButton = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(frameImage)
        frameImage.translatesAutoresizingMaskIntoConstraints = false
        frameImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        frameImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        frameImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(moodButton)
        moodButton.translatesAutoresizingMaskIntoConstraints = false
        moodButton.leftAnchor.constraint(equalTo: frameImage.leftAnchor, constant: 0).isActive = true
        moodButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        moodButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        moodButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        moodButton.setImage(UIImage(), for: .normal)
        moodButton.backgroundColor = .gray
        moodButton.layer.cornerRadius = 25
        moodButton.layer.masksToBounds = true
        moodButton.addTarget(self, action: #selector(moodButtonTouchUpInside), for: .touchUpInside)
        
        contentView.addSubview(nameButton)
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.leftAnchor.constraint(equalTo: frameImage.leftAnchor, constant: 0).isActive = true
        nameButton.topAnchor.constraint(equalTo: moodButton.bottomAnchor, constant: 10).isActive = true
        nameButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        nameButton.text = "123"
        nameButton.textColor = .gray
        nameButton.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        nameButton.textAlignment = .center
    }
    
    @objc
    func moodButtonTouchUpInside() {
        delegate?.didMoodButtonTouchUpInside(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
