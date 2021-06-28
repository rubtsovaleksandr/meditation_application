//
//  CourseDetailsViewController.swift
//  Meditation
//
//  Created by Aleksandr on 29/11/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController, MaleVoiceViewCellDelegate {
    
    let tableView = UITableView()
    let voiceItem: [VoiceItem] = [ VoiceItem(nameVoice: "Focus Attention", timeVoice: "10 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Body Scan", timeVoice: "5 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Making Happiness", timeVoice: "3 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Focus Attention", timeVoice: "10 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Body Scan", timeVoice: "5 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Making Happiness", timeVoice: "3 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Focus Attention", timeVoice: "10 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Body Scan", timeVoice: "5 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Making Happiness", timeVoice: "3 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!),
                                   VoiceItem(nameVoice: "Focus Attention", timeVoice: "10 MIN", playButtonVoice: UIImage(named: "Group6")!, pauseButtonVoice: UIImage(named: "ComponentPause")!)
                                   
    ]
    
    var playingIndexPath: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupView()
    }
    
    func didPlayButtonTouchUpInside(_ didPlayButtonTouchUpInside: MaleVoiceViewCell) {
        guard let indexPath = tableView.indexPath(for: didPlayButtonTouchUpInside) else { return }
        
        if let playingIndexPath = playingIndexPath {
            
            if playingIndexPath == indexPath {
                didPlayButtonTouchUpInside.playButton.setImage(UIImage(named: "Group6"), for: .normal)
                self.playingIndexPath = nil
            } else {
                
                let cell = tableView.cellForRow(at: playingIndexPath) as? MaleVoiceViewCell
                cell?.playButton.setImage(UIImage(named: "Group6"), for: .normal)
                self.playingIndexPath = indexPath
                didPlayButtonTouchUpInside.playButton.setImage(UIImage(named: "ComponentPause"), for: .normal)
            }
        } else {
            
            didPlayButtonTouchUpInside.playButton.setImage(UIImage(named: "ComponentPause"), for: .normal)
            playingIndexPath = indexPath
        }
    }
    
    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.setToolbarHidden(true, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Group 6792")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(pressLeftBarButtonItem))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "Group 6845")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil), UIBarButtonItem(image: UIImage(named: "Group 6846")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)]
    }
    @objc
    func pressLeftBarButtonItem() {
        navigationController?.popViewController(animated: true)
        }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.register(CourseDetailsViewCell.self, forCellReuseIdentifier: "CourseDetailsViewCell")
        tableView.register(MaleVoiceViewCell.self, forCellReuseIdentifier: "MaleVoiceViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension CourseDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voiceItem.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let courseDetailsViewCell = tableView.dequeueReusableCell(withIdentifier: "CourseDetailsViewCell", for: indexPath) as! CourseDetailsViewCell
        return courseDetailsViewCell
        } else if indexPath.row - 1 < voiceItem.count {
            let maleVoiceViewCell = tableView.dequeueReusableCell(withIdentifier: "MaleVoiceViewCell", for: indexPath) as! MaleVoiceViewCell
            let item = voiceItem[indexPath.row - 1]
            maleVoiceViewCell.titleLabel.text = item.nameVoice
            maleVoiceViewCell.subTitleLabel.text = item.timeVoice
            maleVoiceViewCell.delegate = self
            return maleVoiceViewCell
        }
        return MaleVoiceViewCell()
    }
}

extension CourseDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
        return 618
        } else {
            return 100
        }
    }
}

