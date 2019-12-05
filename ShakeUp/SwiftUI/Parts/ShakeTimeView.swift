//
//  ShakeTimeView.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import SwiftUI

struct ShakeTimeView: View {
    @State var isOn = false
    var time: Date
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn) {
                Text(time.toAlarmFormat())
                    .bold()
                    .font(.largeTitle)
            }
            .padding(.horizontal)
        }
    }
}

struct ShakeTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeTimeView(isOn: false, time: Date())
        .previewLayout(.fixed(width: 400, height: 70))
    }
}
