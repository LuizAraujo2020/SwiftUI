//
//  ContentView.swift
//  LottieSwiftUI
//
//  Created by Piotr Wesołowski on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LottieView(lottieFile: "TestAnimation")
            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
