//
//  ContentSectionTextView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentSectionTextView: View {
    @ObservedObject var viewModel: ContentView.ViewModel
    @State var presentSizeText = false

    var body: some View {
        Section {
            VStack {
//                NavigationLink {
//                    TextSizeView()
//                } label: {
                    HStack {
                        Text("Tamanho do Texto")
                            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                        Spacer()
                    }
                    .onTapGesture {
                        presentSizeText = true
                    }
//                }

                
                Divider()

                HStack {
                    Text("Negrito")
                        .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                    Spacer()
                    Toggle("", isOn: $viewModel.isBold)
                }
            }
        }
        .sheet(isPresented: $presentSizeText) {
            TextSizeView(viewModel: viewModel)
        }
    }
}
extension ContentSectionTextView {
    struct TextSizeView: View {
        @ObservedObject var viewModel: ContentView.ViewModel

        @State var sss = 0.4
        var body: some View {
            VStack {
                Text("Os apps compatíveis com a Fonte Dinâmica se ajustarão ao tamanho de leitura preferido abaixo.")
                    .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                    .padding()

                Spacer()

                Slider(value: $viewModel.textSize, in: 0.7...1.4, step: 0.1) {

                } minimumValueLabel: {
                    Text("A")
                        .font(.footnote)

                } maximumValueLabel: {
                    Text("A")
                        .font(.title)
                }
            }
            .padding()
            .navigationTitle("Tamanho do Texto")
        }
    }

}

struct ContentSectionTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Form {
                ContentSectionTextView(viewModel: ContentView.ViewModel())
            }
        }
    }
}
