//
//  InfoSleepCell.swift
//  Meditation
//
//  Created by Aleksandr on 13/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class InfoSleepCell: UICollectionViewCell {

    let colorView = UIColor(red: 30 / 255, green: 37 / 255, blue: 94 / 255, alpha: 1)
    let nameMusic = UILabel()
    let timeMusic = UILabel()
    let descriptionMusic = UILabel()
    let favorits = UIImageView()
    let favoritsLabel = UILabel()
    let pods = UIImageView()
    let podsLabel = UILabel()
    

    override init(frame: CGRect) {
    super.init(frame: frame)
    
        contentView.backgroundColor = colorView
        contentView.addSubview(nameMusic)
        contentView.addSubview(timeMusic)
        contentView.addSubview(descriptionMusic)
        contentView.addSubview(favorits)
        contentView.addSubview(favoritsLabel)
        contentView.addSubview(pods)
        contentView.addSubview(podsLabel)
        
        nameMusic.translatesAutoresizingMaskIntoConstraints = false
        nameMusic.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        nameMusic.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameMusic.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        nameMusic.text = "Night  Island"
        nameMusic.textColor = .white
        nameMusic.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        timeMusic.translatesAutoresizingMaskIntoConstraints = false
        timeMusic.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        timeMusic.topAnchor.constraint(equalTo: nameMusic.bottomAnchor, constant: 16).isActive = true
        timeMusic.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        timeMusic.text = "45 MIN ' SLEEP MUSIC"
        timeMusic.textColor = .lightGray
        timeMusic.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        descriptionMusic.translatesAutoresizingMaskIntoConstraints = false
        descriptionMusic.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        descriptionMusic.topAnchor.constraint(equalTo: timeMusic.bottomAnchor, constant: 16).isActive = true
        descriptionMusic.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        descriptionMusic.text = "Ease the mind into a restful night’s sleep with these deep, amblent tones."
        descriptionMusic.textColor = .lightGray
        descriptionMusic.font = UIFont.systemFont(ofSize: 16, weight: .light)
        descriptionMusic.numberOfLines = 2
        
        favorits.translatesAutoresizingMaskIntoConstraints = false
        favorits.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        favorits.topAnchor.constraint(equalTo: descriptionMusic.bottomAnchor, constant: 38).isActive = true
        favorits.widthAnchor.constraint(equalToConstant: 18).isActive = true
        favorits.heightAnchor.constraint(equalToConstant: 16).isActive = true
        favorits.image = UIImage(named: "Vectorlike")
        
        favoritsLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritsLabel.leftAnchor.constraint(equalTo: favorits.rightAnchor, constant: 10).isActive = true
        favoritsLabel.topAnchor.constraint(equalTo: descriptionMusic.bottomAnchor, constant: 39).isActive = true
        favoritsLabel.text = "24.234 Favorits"
        favoritsLabel.textColor = .white
        favoritsLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        podsLabel.translatesAutoresizingMaskIntoConstraints = false
        podsLabel.topAnchor.constraint(equalTo: descriptionMusic.bottomAnchor, constant: 39).isActive = true
        podsLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        podsLabel.text = "34.234 Lestening"
        podsLabel.textColor = .white
        podsLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        pods.translatesAutoresizingMaskIntoConstraints = false
        pods.topAnchor.constraint(equalTo: descriptionMusic.bottomAnchor, constant: 38).isActive = true
        pods.rightAnchor.constraint(equalTo: podsLabel.leftAnchor, constant: -10).isActive = true
        pods.widthAnchor.constraint(equalToConstant: 18).isActive = true
        pods.heightAnchor.constraint(equalToConstant: 16).isActive = true
        pods.image = UIImage(named: "FramePods")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
