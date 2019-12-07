//
//  ShakeTimesListView.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/05.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import SwiftUI

struct ShakeTimesListView: View {
    @EnvironmentObject var shakeTimes: ShakeTimesViewModel
    
    var body: some View {
        List {
            ForEach(shakeTimes.shakeTimes) { shakeTime in
                ShakeTimeView(shakeTime: shakeTime)
            }
        }
    }
}

struct ShakeTimesListView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeTimesListView()
            .environmentObject(ShakeTimesViewModel())
    }
}
