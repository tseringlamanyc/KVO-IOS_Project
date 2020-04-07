//
//  ViewController.swift
//  KVO-IOS_Project
//
//  Created by Tsering Lama on 4/7/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    
    private var iconNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObservers()
    }
    
    private func configureObservers() {
        configureFontSizeObservation()
        configureIconNameObservation()
    }
    
    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self](settings, change) in
            guard let newSize = change.newValue else {return}
            let fontSize = CGFloat(newSize)
            self?.welcomeLabel.font = UIFont.systemFont(ofSize: fontSize)
        })
    }
    
    private func configureIconNameObservation() {
        iconNameObservation = Settings.shared.observe(\.iconName, options: [.old, .new], changeHandler: {[weak self] (settings, change) in
            guard let newIcon = change.newValue else {return}
            self?.iconImageView.image = UIImage(systemName: newIcon)
        })
    }
    
    deinit {  // gets called when the object is no longer in memory
        fontSizeObservation?.invalidate()
        iconNameObservation?.invalidate()
    }
}
