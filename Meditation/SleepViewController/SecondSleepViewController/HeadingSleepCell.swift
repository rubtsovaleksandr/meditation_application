//
//  HeadingSleepCell.swift
//  Meditation
//
//  Created by Aleksandr on 13/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class HeadingSleepCell: UICollectionViewCell {
    
    let colorView = UIColor(red: 30 / 255, green: 37 / 255, blue: 94 / 255, alpha: 1)
    let imageCell = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = colorView
        contentView.addSubview(imageCell)
        
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageCell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageCell.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageCell.image = UIImage(named: "Mask Group_1")
        imageCell.layer.masksToBounds = true
        imageCell.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
