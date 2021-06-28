//
//  MeditateScrollViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 07/12/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class SecondMeditateScrollViewCell: UICollectionViewCell {

    let imageObject = UIImageView()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageObject)
        imageObject.translatesAutoresizingMaskIntoConstraints = false
        imageObject.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageObject.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageObject.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageObject.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        imageObject.backgroundColor = .white
        imageObject.layer.cornerRadius = 10
        imageObject.image = UIImage()
        imageObject.contentMode = .scaleToFill
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        titleLabel.text = ""
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
