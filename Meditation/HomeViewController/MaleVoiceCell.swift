//
//  MaleVoiceCell.swift
//  Meditation
//
//  Created by Aleksandr on 30/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

protocol MaleVoiceViewCellDelegate: class {
    func didPlayButtonTouchUpInside(_ didPlayButtonTouchUpInside: MaleVoiceViewCell)
}

class MaleVoiceViewCell: UITableViewCell {
    
    weak var delegate: MaleVoiceViewCellDelegate?
    
    let playButton = UIButton()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    var isAddButton = Bool()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.addTarget(self, action: #selector(playButtonTouchUpInside), for: .touchUpInside)
        playButton.setImage(UIImage(named: "Group6"), for: .normal)
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = ""
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 20).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        subTitleLabel.text = ""
        subTitleLabel.textColor = .lightGray
        subTitleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
    }
    
    @objc
    func playButtonTouchUpInside() {
        delegate?.didPlayButtonTouchUpInside(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
