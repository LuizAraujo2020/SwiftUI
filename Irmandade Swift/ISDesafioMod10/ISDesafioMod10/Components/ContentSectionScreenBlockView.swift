//
//  ContentSectionScreenBlockView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentSectionScreenBlockView: View {
    @ObservedObject var viewModel: ContentView.ViewModel

    var body: some View {
        Section {
            VStack {

                NavigationLink {

                } label: {
                    HStack {
                        Text("Bloqueio Automático")
                            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                        Spacer()
                        //                Toggle("", isOn: $viewModel.appearanceToggle)

                        Text("30 segundos")
                            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                    }
                }

                Divider()

                HStack {


                    HStack {
                        Text("Elevar para Despertar")
                            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                        Spacer()
                        Toggle("", isOn: $viewModel.appearanceToggle)
                    }
                }
            }
        }
    }
}

struct ContentSectionScreenBlockView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ContentSectionScreenBlockView(viewModel: ContentView.ViewModel())
        }
    }
}
