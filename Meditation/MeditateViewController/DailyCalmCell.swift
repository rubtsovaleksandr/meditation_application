//
//  DailyCalmCell.swift
//  Meditation
//
//  Created by Aleksandr on 07/12/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class DailyCalmCell: UICollectionViewCell {
    
    let imageColor = UIColor(displayP3Red: 236 / 255, green: 211 / 255, blue: 194 / 255, alpha: 1)
    
    let imageCell = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let playButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageCell)
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 95).isActive = true
        imageCell.layer.cornerRadius = 10
        imageCell.layer.masksToBounds = true
        imageCell.image = UIImage(named: "MaskGroupMeditate")
        imageCell.backgroundColor = imageColor
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 45).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37).isActive = true
        titleLabel.text = "Daily Calm"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 45).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.text = "APR 30 ' PAUSE PRACTICE"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        
        contentView.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37.5).isActive = true
        playButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.setImage(UIImage(named: "Group6Medit"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
