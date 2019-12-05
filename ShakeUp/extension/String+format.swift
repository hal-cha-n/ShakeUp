//
//  String+format.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import Foundation

extension Date {
    func toAlarmFormat() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("Hm")
        return formatter.string(from: self)
    }
}
