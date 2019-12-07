//
//  ShakeTimeView.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import SwiftUI

struct ShakeTimeView: View {
    @ObservedObject var shakeTime: ShakeTime
    
    var body: some View {
        Toggle(isOn: $shakeTime.isOn) {
            Text(String(format: "%02d:%02d", shakeTime.hour, shakeTime.minute))
                .bold()
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .frame(height: 80.0)
    }
}

struct ShakeTimeView_Previews: PreviewProvider {
    static var previews: some View {
        let shakeTime = ShakeTime()
        shakeTime.hour = 22
        return ShakeTimeView(shakeTime: shakeTime)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
