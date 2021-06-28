//
//  VerticalHomeViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 18/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

protocol VerticalHomeViewCellDelegate: class {
    func didPressStartButton()
}

class VerticalHomeViewCell: UICollectionViewCell {
    
    weak var delegate: VerticalHomeViewCellDelegate?
    
    let backroundImage = UIImageView()
    let imageCell = UIImageView()
    
    var position: CollectionCellPosition? {
        didSet {
            guard let position = position else { return }
            switch position {
            case .left:
                leftBackroundImageConstraint?.constant = 16
                rightBackroundImageConstraint?.constant = -8
                imageCell.image = UIImage(named: "Group 6855")
                titleLabel.text = "Basics"
                subTitleLabel.text = "COURSE"
            case .right:
                leftBackroundImageConstraint?.constant = 8
                rightBackroundImageConstraint?.constant = -16
                imageCell.image = UIImage(named: "Group 6854")
                titleLabel.text = "Relaxation"
                titleLabel.textColor = .black
                subTitleLabel.text = "MUSIC"
                subTitleLabel.textColor = .black
                timeLabel.textColor = .black
                startButton.backgroundColor = .black
                startButton.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    var leftBackroundImageConstraint: NSLayoutConstraint?
    var rightBackroundImageConstraint: NSLayoutConstraint?
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let timeLabel = UILabel()
    let startButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageCell)
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        leftBackroundImageConstraint = imageCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        leftBackroundImageConstraint?.isActive = true
        imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        rightBackroundImageConstraint = imageCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        rightBackroundImageConstraint?.isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 210).isActive = true
        imageCell.image = UIImage()
        imageCell.contentMode = .scaleToFill
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: imageCell.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 85).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        titleLabel.text = ""
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: imageCell.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        subTitleLabel.text = ""
        subTitleLabel.textColor = .white
        subTitleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leftAnchor.constraint(equalTo: imageCell.leftAnchor, constant: 16).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26).isActive = true
        timeLabel.text = "3-10 MIN"
        timeLabel.textColor = .white
        timeLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        
        contentView.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24).isActive = true
        startButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = 18
        startButton.addTarget(self, action: #selector(startButtonTouchUpInside), for: .touchUpInside)
    }
    
    @objc
    func startButtonTouchUpInside() {
        delegate?.didPressStartButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
