//
//  ContentSectionNightShiftView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentSectionNightShiftView: View {
    @ObservedObject var viewModel: ContentView.ViewModel

    var body: some View {
        Section {

            HStack {
                Text("Night Shift")
                    .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                Spacer()
//                Toggle("", isOn: $viewModel.appearanceToggle)

                Text(viewModel.appearanceToggle ? "Ativado": "Desativado")
                    .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
            }
        }
    }
}

struct ContentSectionNightShiftView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ContentSectionNightShiftView(viewModel: ContentView.ViewModel())
        }
    }
}
