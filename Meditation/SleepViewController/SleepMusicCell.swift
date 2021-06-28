//
//  SleepMusicCell.swift
//  Meditation
//
//  Created by Aleksandr on 12/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

enum CollectionCellPosition {
    case left
    case right
}

class SleepMusicCell: UICollectionViewCell {
    
    let imageMusic = UIImageView()
    let nameMusic = UILabel()
    let timeMusic = UILabel()
    
    var position: CollectionCellPosition? {
        didSet {
            guard let position = position else { return }
            switch position {
            case .left:
                leftImageConstraint?.constant = 16
                rightImageConstraint?.constant = -8
                leftNameMusicConstraint?.constant = 16
                rightNameMusicConstraint?.constant = -8
                leftTimeMusicConstraint?.constant = 16
                rightTimeMusicConstraint?.constant = -8
            case .right:
                leftImageConstraint?.constant = 8
                rightImageConstraint?.constant = -16
                leftNameMusicConstraint?.constant = 8
                rightNameMusicConstraint?.constant = -16
                leftTimeMusicConstraint?.constant = 8
                rightTimeMusicConstraint?.constant = -16
            }
        }
    }
    
    var leftImageConstraint: NSLayoutConstraint?
    var rightImageConstraint: NSLayoutConstraint?
    var leftNameMusicConstraint: NSLayoutConstraint?
    var rightNameMusicConstraint: NSLayoutConstraint?
    var leftTimeMusicConstraint: NSLayoutConstraint?
    var rightTimeMusicConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageMusic)
        contentView.addSubview(nameMusic)
        contentView.addSubview(timeMusic)
        
        imageMusic.translatesAutoresizingMaskIntoConstraints = false
        leftImageConstraint = imageMusic.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16)
        leftImageConstraint?.isActive = true
        imageMusic.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        rightImageConstraint = imageMusic.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16)
        rightImageConstraint?.isActive = true
        imageMusic.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 2 / 3 ).isActive = true
        imageMusic.layer.masksToBounds = true
        imageMusic.layer.cornerRadius = 8
        imageMusic.backgroundColor = .white
        imageMusic.image = UIImage(named: "111")
        
        nameMusic.translatesAutoresizingMaskIntoConstraints = false
        leftNameMusicConstraint = nameMusic.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16)
        leftNameMusicConstraint?.isActive = true
        nameMusic.topAnchor.constraint(equalTo: imageMusic.bottomAnchor, constant: 10).isActive = true
        rightNameMusicConstraint = nameMusic.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16)
        rightNameMusicConstraint?.isActive = true
        nameMusic.text = "Night Island"
        nameMusic.textColor = .white
        nameMusic.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        timeMusic.translatesAutoresizingMaskIntoConstraints = false
        leftTimeMusicConstraint = timeMusic.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16)
        leftTimeMusicConstraint?.isActive = true
        timeMusic.topAnchor.constraint(equalTo: nameMusic.bottomAnchor, constant: 6).isActive = true
        rightTimeMusicConstraint = timeMusic.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16)
        rightTimeMusicConstraint?.isActive = true
        timeMusic.text = "45 MIN ' SLEEP MUSIC"
        timeMusic.textColor = .lightGray
        timeMusic.font = UIFont.systemFont(ofSize: 11, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
