//
//  ChooseTopicViewController.swift
//  Meditation
//
//  Created by Aleksandr on 18/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class ChooseTopicViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let chooseTopicViewLayout = ChooseTopicViewLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: chooseTopicViewLayout)
    
    let items: [ChooseTopicViewItem] = [ChooseTopicViewItem(image: UIImage(named: "Component 1")!, title: "Reduce Stress", titleColor: .white),
                                        ChooseTopicViewItem(image: UIImage(named: "Group 6790")!, title: "Improve Performanee", titleColor: .white),
                                        ChooseTopicViewItem(image: UIImage(named: "Component3CT")!, title: "Increase Happiness", titleColor: .black),
                                        ChooseTopicViewItem(image: UIImage(named: "Component2CT")!, title: "Reduce Anxiety", titleColor: .black),
                                        ChooseTopicViewItem(image: UIImage(named: "Group21CT")!, title: "Personal Growth", titleColor: .white),
                                        ChooseTopicViewItem(image: UIImage(named: "Component4CT")!, title: "Better Sleep", titleColor: .white),
                                        ChooseTopicViewItem(image: UIImage(named: "Component 1")!, title: "Reduce Stress", titleColor: .black),
                                        ChooseTopicViewItem(image: UIImage(named: "Component5CT")!, title: "Reduce Stress", titleColor: .black)
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 76).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        titleLabel.text = "What Brings you \nto Silent Moon?"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 2
        let titleLabelAttribitedText = NSMutableAttributedString(string: "What Brings you ", attributes: [.font: UIFont.systemFont(ofSize: 28, weight: .bold), .foregroundColor: UIColor.black])
        titleLabelAttribitedText.append(NSAttributedString(string: "\nto Silent Moon?", attributes: [.font: UIFont.systemFont(ofSize: 28, weight: .light), .foregroundColor: UIColor.black]))
        titleLabel.attributedText = titleLabelAttribitedText
        
        view.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        subTitleLabel.text = "choose a topic to focuse on:"
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.backgroundColor = .white
        collectionView.register(ChooseTopicViewCell.self, forCellWithReuseIdentifier: "ChooseTopicViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ChooseTopicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseTopicViewCell", for: indexPath) as! ChooseTopicViewCell
        let item = items[indexPath.row]
        cell.imageObject.image = item.image
        cell.titleLabel.text = item.title
        cell.titleLabel.textColor = item.titleColor
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ChooseTopicViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let remindersViewController = RemindersViewController()
        navigationController?.pushViewController(remindersViewController, animated: true)
    }
}
