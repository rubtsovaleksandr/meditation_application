//
//  CourseDetailsViewCell.swift
//  Meditation
//
//  Created by Aleksandr on 30/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class CourseDetailsViewCell: UITableViewCell {
    
    let titleImage = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let thirdTitleLabel = UILabel()
    let likeImage = UIImageView()
    let lesteningImage = UIImageView()
    let likeLabel = UILabel()
    let lesteningLabel = UILabel()
    let narratorLabel = UILabel()
    let maleVoiceButtom = UIButton()
    let femaleVoiceButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleImage)
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        titleImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        titleImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        titleImage.heightAnchor.constraint(equalToConstant: 288).isActive = true
        titleImage.image = UIImage(named: "MaskGroupCD")
        titleImage.contentMode = .scaleToFill
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        titleLabel.text = "Happy Morning"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        subTitleLabel.text = "COURSE"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(thirdTitleLabel)
        thirdTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdTitleLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        thirdTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20).isActive = true
        thirdTitleLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        thirdTitleLabel.text = "Ease the mind into a restful night’s sleep with \nthese deep, amblent tones."
        thirdTitleLabel.textColor = .lightGray
        thirdTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        thirdTitleLabel.numberOfLines = 2
        
        contentView.addSubview(likeImage)
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeImage.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        likeImage.topAnchor.constraint(equalTo: thirdTitleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        likeImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        likeImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        likeImage.image = UIImage(named: "Vectorlove")
        
        contentView.addSubview(likeLabel)
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.leftAnchor.constraint(equalTo: likeImage.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        likeLabel.topAnchor.constraint(equalTo: thirdTitleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        likeLabel.text = "24.234 Favorits"
        likeLabel.textColor = .lightGray
        likeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(lesteningImage)
        lesteningImage.translatesAutoresizingMaskIntoConstraints = false
        lesteningImage.topAnchor.constraint(equalTo: thirdTitleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        lesteningImage.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        lesteningImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        lesteningImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        lesteningImage.image = UIImage(named: "FrameUshi")
        
        contentView.addSubview(lesteningLabel)
        lesteningLabel.translatesAutoresizingMaskIntoConstraints = false
        lesteningLabel.leftAnchor.constraint(equalTo: lesteningImage.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        lesteningLabel.topAnchor.constraint(equalTo: thirdTitleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        lesteningLabel.text = "34.234 Lestening"
        lesteningLabel.textColor = .lightGray
        lesteningLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(narratorLabel)
        narratorLabel.translatesAutoresizingMaskIntoConstraints = false
        narratorLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        narratorLabel.topAnchor.constraint(equalTo: likeImage.safeAreaLayoutGuide.bottomAnchor, constant: 40).isActive = true
        narratorLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        narratorLabel.text = "Pick a Narrator"
        narratorLabel.textColor = .black
        narratorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        contentView.addSubview(maleVoiceButtom)
        maleVoiceButtom.translatesAutoresizingMaskIntoConstraints = false
        maleVoiceButtom.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        maleVoiceButtom.topAnchor.constraint(equalTo: narratorLabel.bottomAnchor, constant: 20).isActive = true
        maleVoiceButtom.setTitle("MALE VOICE", for: .normal)
        maleVoiceButtom.setTitleColor(.lightGray, for: .normal)
        maleVoiceButtom.isSelected = true
        maleVoiceButtom.setTitleColor(.blue, for: .selected)
        maleVoiceButtom.addTarget(self, action: #selector(maleVoiceButtonTouchUpInside), for: .touchUpInside)
        
        
        contentView.addSubview(femaleVoiceButton)
        femaleVoiceButton.translatesAutoresizingMaskIntoConstraints = false
        femaleVoiceButton.topAnchor.constraint(equalTo: narratorLabel.bottomAnchor, constant: 20).isActive = true
        femaleVoiceButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 40).isActive = true
        femaleVoiceButton.setTitle("FEMALE VOICE", for: .normal)
        femaleVoiceButton.setTitleColor(.lightGray, for: .normal)
        femaleVoiceButton.setTitleColor(.blue, for: .selected)
        femaleVoiceButton.addTarget(self, action: #selector(femaleVoiceButtonTouchUpInside), for: .touchUpInside)
        
    }
    
    @objc
    func maleVoiceButtonTouchUpInside() {
        maleVoiceButtom.isSelected = true
        femaleVoiceButton.isSelected = false
    }
    
    @objc
    func femaleVoiceButtonTouchUpInside() {
        femaleVoiceButton.isSelected = true
        maleVoiceButtom.isSelected = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
