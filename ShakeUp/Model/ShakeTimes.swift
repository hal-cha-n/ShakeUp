//
//  ShakeTimes.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import Combine
import Foundation
import UserNotifications

class ShakeTimesViewModel: ObservableObject {
    static var launchWakeUp = CurrentValueSubject<Bool, Never>(false)
    @Published var shakeTimes = ConstructFromUserDefaults()
    @Published var isPresentingShakeUpView = false
    private var cancellable: Cancellable?
    
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
    
    init() {
        cancellable = ShakeTimesViewModel.launchWakeUp.sink {
            self.isPresentingShakeUpView = $0
        }
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Allowed")
            } else {
                print("Didn't allowed")
            }
        }
    }
}
