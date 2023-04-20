//
//  ContentSectionScreenView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentSectionScreenView: View {
    @ObservedObject var viewModel: ContentView.ViewModel

    var body: some View {

        Section {
            NavigationLink {

            } label: {

                HStack {
                    Text("Zoom da Tela")
                        .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))

                    Spacer()
                    //                Toggle("", isOn: $viewModel.appearanceToggle)

                    Text("Padrão")
                        .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                }
            }

        } header: {
            Text("TELA")
                .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
        } footer: {
            Text("Escolha uma visualização para o iPhone. Texto Maior mosta os controles ampliados Padrão mostra mais conteúdo")
                .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
        }
    }
}

struct ContentSectionScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentSectionScreenView(viewModel: ContentView.ViewModel())
    }
}
