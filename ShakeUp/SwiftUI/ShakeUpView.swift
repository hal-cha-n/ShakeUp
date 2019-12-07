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
        Text(String(format: "%3.0f P", Float(shakeViewModel.power)))
            .font(.largeTitle)
    }
}

struct ShakeUpView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeUpView()
    }
}
