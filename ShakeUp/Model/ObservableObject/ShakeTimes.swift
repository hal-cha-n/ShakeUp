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
        let now = Date()
        var result = [ShakeTime]()
        (1...100).forEach { i in
            var time = ShakeTime()
            time.date = Date(timeInterval: TimeInterval(60*60*i), since: now)
            result.append(time)
        }
        return result
    }
}
