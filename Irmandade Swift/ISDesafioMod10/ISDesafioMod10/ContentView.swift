//
//  ContentView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        ZStack {
            Form {
                ContentSectionAppearanceView(viewModel: viewModel)

                ContentSectionTextView(viewModel: viewModel)

                ContentSectionBrightnessView(viewModel: viewModel)

                ContentSectionNightShiftView(viewModel: viewModel)

                ContentSectionScreenBlockView(viewModel: viewModel)

                ContentSectionScreenView(viewModel: viewModel)

            }
            .preferredColorScheme(viewModel.isDarkMode ? .dark : .light)
            .animation(.easeInOut, value: viewModel.isDarkMode)

////            if viewModel.trueToneEnabled {
//                Color.black.ignoresSafeArea()
//                    .opacity(1 - viewModel.brightness)
////                    .accessibilityRespondsToUserInteraction(false)
////            }
        }
        .onAppear {
            UIScreen.main.brightness = 0.1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
