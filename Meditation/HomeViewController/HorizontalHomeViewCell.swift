//
//  HorizontalHomeViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 18/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class HorizontalHomeViewCell: UICollectionViewCell {
    
    let backroundImage = UIImageView()
    let viewColor = UIColor(red: 51 / 255, green: 50 / 255, blue: 66 / 255, alpha: 1)
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let playButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backroundImage)
        backroundImage.translatesAutoresizingMaskIntoConstraints = false
        backroundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        backroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        backroundImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        backroundImage.heightAnchor.constraint(equalToConstant: 95).isActive = true
        backroundImage.backgroundColor = viewColor
        backroundImage.layer.cornerRadius = 10
        backroundImage.image = UIImage(named: "MaskGroupGorizontHVC")
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 46).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -46).isActive = true
        titleLabel.text = "Daily Thought"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 46).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -46).isActive = true
        subTitleLabel.text = "MEDITATION ' 3-10 MIN"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        
        contentView.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47.5).isActive = true
        playButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -46).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.setImage(UIImage(named: "Group6HHV"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
