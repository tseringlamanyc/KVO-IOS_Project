//
//  SettingsVC.swift
//  KVO-IOS_Project
//
//  Created by Tsering Lama on 4/7/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // data for the picker view
    private let iconNames = ["sun.haze.fill", "moon", "globe", "icloud"]  // system image names(Sf symbols)
    
    private var fontSizeObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        configureFontSizeObservation()
    }
    
    private func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let newSize = change.newValue else {return}
            self?.fontSizeLabel.text = newSize.description
        })
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let newSize = Int(sender.value)
        Settings.shared.fontSize = newSize
    }
}

extension SettingsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // colomuns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iconNames.count // rows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iconNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let iconName = iconNames[row]
        Settings.shared.iconName = iconName
    }
}
