//
//  Settings.swift
//  KVO-IOS_Project
//
//  Created by Tsering Lama on 4/7/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation

/*
 KVO Compliant
 */

@objc
class Settings: NSObject {  // inherit
   static var shared = Settings()
    @objc dynamic var fontSize: Int // marked for observing 
    @objc dynamic var iconName: String
    override private init() {
       fontSize = 17
       iconName = "sun.haze.fill"
    }
}
