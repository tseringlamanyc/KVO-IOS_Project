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
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [], changeHandler: { (settings, change) in
            
        })
    }
    
    private func configureIconNameObservation() {
        fontSizeObservation = Settings.shared.observe(\.iconName, options: [], changeHandler: { (settings, change) in
            
        })
    }
    
    
}

