//
//  ShakeViewModel.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/07.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import Foundation
import CoreMotion
import Combine
import UIKit

class ShakeViewModel: ObservableObject {
    @Published var power = Double(0)
    let motionManager = CMMotionManager()

    init() {
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1

            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {(motion:CMDeviceMotion?, error:Error?) in
                print(motion?.userAcceleration)
                self.power += abs(motion?.userAcceleration.y ?? 0)
                
                if self.power >= 100 {
                    let window = UIApplication.shared.windows.first
                    window?.rootViewController?.presentedViewController?.dismiss(animated: true)
                }
            })
        }
        
    }
}
