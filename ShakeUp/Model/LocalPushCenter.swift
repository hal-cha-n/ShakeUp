//
//  LocalPushCenter.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/07.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class LocalPushCenter {
    static func sendLocalPush(hour: Int, minute: Int) {
        
        let timeString = String(format: "%02d:%02d", hour, minute)
        let content = UNMutableNotificationContent()
        content.title = "タイトル"
        content.subtitle = "\(timeString)のアラーム"
        content.body = "アラームの時間ですよ〜"
        content.sound = UNNotificationSound.default // UNNotificationSound(named:) で任意の音を設定可

        let component = DateComponents(hour: hour, minute: minute, second: 0, nanosecond: 0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component,
                                                    repeats: false)

        let request = UNNotificationRequest(identifier: "TIMER \(timeString)",
                                            content: content,
                                            trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.delegate = (UIApplication.shared.delegate as! AppDelegate)
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }

    }
}
