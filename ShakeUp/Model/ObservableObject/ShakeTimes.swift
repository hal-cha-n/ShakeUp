//
//  ShakeTimes.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import Foundation

class ShakeTimesViewModel: ObservableObject {
    @Published var shakeTimes = ConstructFromUserDefaults()
    
    static private func ConstructFromUserDefaults() -> [ShakeTime] {
        var result = [ShakeTime]()
        (0...23).forEach { i in
            let shakeTime = ShakeTime()
            shakeTime.hour = i
            shakeTime.minute = 0
            shakeTime.isOn = false
            result.append(shakeTime)
        }
        return result
    }
}
