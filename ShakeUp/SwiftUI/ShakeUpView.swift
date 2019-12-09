//
//  ShakeUpView.swift
//  ShakeUp
//
//  Created by Hal Stroemeria on 2019/12/07.
//  Copyright © 2019 hal-cha-n. All rights reserved.
//

import SwiftUI

struct ShakeUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject(initialValue: ShakeViewModel()) var shakeViewModel: ShakeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(String(format: "%3.0f P", Float(shakeViewModel.power)))
                .font(.largeTitle)
            if shakeViewModel.isAwaked {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("起きた!")
                        .font(.largeTitle)
                })
            }
        }.onAppear {
            self.shakeViewModel.startWakeUp()
        }.onDisappear {
            self.shakeViewModel.finishWakeUp()
        }
    }
}

struct ShakeUpView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeUpView()
    }
}
