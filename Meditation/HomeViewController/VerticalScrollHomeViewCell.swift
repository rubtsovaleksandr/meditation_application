//
//  VerticalScrollHomeViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 18/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class VerticalScrollHomeViewCell: UICollectionViewCell {
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionVIew.isPagingEnabled = true
        return collectionVIew
    }()
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.backgroundColor = .white
        collectionView.register(VerticalScrollCell.self, forCellWithReuseIdentifier: "VerticalScrollCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        titleLabel.text = "Recomended for you"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerticalScrollHomeViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalScrollCell", for: indexPath) as! VerticalScrollCell
        if indexPath.row % 2 == 0 {
            cell.position = .left
        }
        if indexPath.row % 2 == 1 {
            cell.position = .right
        }
        return cell
    }
}

extension VerticalScrollHomeViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: 247)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class VerticalScrollCell: UICollectionViewCell {
    
    let backroundImage = UIImageView()
    var image = UIImageView()
    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    
    var position: CollectionCellPosition? {
        didSet {
            guard let position = position else { return }
            switch position {
            case .left:
                leftBackroundImageConstraint?.constant = 16
                rightBackroundImageConstraint?.constant = -8
                image.image = UIImage(named: "Group 6853")
                titleLabel.text = " Focus"
                subTitleLabel.text = " MEDITATION ' 3-10 MIN"
            case .right:
                leftBackroundImageConstraint?.constant = 8
                rightBackroundImageConstraint?.constant = -16
                image.image = UIImage(named: "Group24HVC")
                titleLabel.text = " Happiness"
                subTitleLabel.text = " MEDITATION ' 3-10 MIN"
            }
        }
    }
    
    var leftBackroundImageConstraint: NSLayoutConstraint?
    var rightBackroundImageConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backroundImage)
        backroundImage.translatesAutoresizingMaskIntoConstraints = false
        leftBackroundImageConstraint = backroundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        leftBackroundImageConstraint?.isActive = true
        backroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 86).isActive = true
        rightBackroundImageConstraint = backroundImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        rightBackroundImageConstraint?.isActive = true
        backroundImage.heightAnchor.constraint(equalToConstant: 161).isActive = true
        backroundImage.backgroundColor = .white
        backroundImage.layer.cornerRadius = 10
        
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        leftBackroundImageConstraint = image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        leftBackroundImageConstraint?.isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 86).isActive = true
        rightBackroundImageConstraint = image.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        rightBackroundImageConstraint?.isActive = true
        image.heightAnchor.constraint(equalToConstant: 113).isActive = true
        image.image = UIImage()
        image.contentMode = .scaleToFill
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        titleLabel.text = " Focus"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        subTitleLabel.text = " MEDITATION ' 3-10 MIN"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
