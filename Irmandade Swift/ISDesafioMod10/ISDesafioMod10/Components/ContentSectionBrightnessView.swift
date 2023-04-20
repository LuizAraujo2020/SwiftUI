//
//  ContentSectionBrightnessView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentSectionBrightnessView: View {
    @ObservedObject var viewModel: ContentView.ViewModel

    var body: some View {
        Section() {
            VStack {
                HStack {
                    Image(systemName: "sun.max.fill")
                        .imageScale(.small)
                    Slider(value: $viewModel.brightness, in: 0...1) { }
                    Image(systemName: "sun.max.fill")
                        .imageScale(.large)
                }

                Divider()

                HStack {
                    Text("True Tone")
                        .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                    Spacer()
                    Toggle("", isOn: $viewModel.trueToneEnabled)
                }
            }

        }  header: {
            Text("Brilho")
                .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))

        } footer: {
            Text("Adapte a tela do iPhone automaticamente de acordo com a iluminação ambiente para que as cores apareçam consistentemente em ambientes diferentes.")
                .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
        }
        .onChange(of: viewModel.brightness) { newValue in
            UIScreen.main.wantsSoftwareDimming = true
            UIScreen.main.brightness = newValue
            UIDevice.current.isProximityMonitoringEnabled = true
        }
    }
}

struct ContentSectionBrightnessView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ContentSectionBrightnessView(viewModel: ContentView.ViewModel())
        }
    }
}
