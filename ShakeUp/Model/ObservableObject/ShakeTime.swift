//
//  ShakeTime.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import Foundation
import Combine

class ShakeTime: ObservableObject, Identifiable {
    var hour = 0
    var minute = 0
    var isOn = false {
        didSet {
            print("\(hour):\(minute) is \(isOn)")
            if isOn {
                LocalPushCenter.sendLocalPush(hour: hour, minute: minute)
            }
        }
    }
}
