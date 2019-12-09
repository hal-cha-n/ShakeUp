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
import AVKit

class ShakeViewModel: ObservableObject {
    @Published var power = Double(0)
    @Published var isAwaked = false
    let motionManager = CMMotionManager()
    var audioPlayer: AVAudioPlayer?
    
    func startWakeUp() {
        guard motionManager.isDeviceMotionAvailable,
              let path = Bundle.main.url(forResource: "alerm", withExtension: "mp3") else { return }

        motionManager.deviceMotionUpdateInterval = 0.1

        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {(motion:CMDeviceMotion?, error:Error?) in
            print(motion?.userAcceleration)
            self.power += abs(motion?.userAcceleration.y ?? 0)
            
            if self.power >= 100 {
                self.isAwaked = true
            }
        })

        try! AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try! AVAudioSession.sharedInstance().setActive(true)

        audioPlayer = try! AVAudioPlayer(contentsOf: path)
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.play()
    }
    
    func finishWakeUp() {
        motionManager.stopDeviceMotionUpdates()
        audioPlayer?.stop()
    }
}
