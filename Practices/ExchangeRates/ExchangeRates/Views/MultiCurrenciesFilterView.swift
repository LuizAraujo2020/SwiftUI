//
//  MultiCurrenciesFilterView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import SwiftUI

protocol MultiCurrenciesFilterViewDelegate {
    func didSelected(_ currencies: [String])
}

struct MultiCurrenciesFilterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ViewModel()

    @State private var searchText = ""
    @State private var selections = [String]()

    var delegate: MultiCurrenciesFilterViewDelegate?

    var body: some View {
        NavigationView {
            VStack {
                if case .loading = viewModel.currentState {
                    ProgressView()
                        .scaleEffect(2.2, anchor: .center)
                } else if case .success = viewModel.currentState {
                    listCurrenciesView()
                } else if case .success = viewModel.currentState {
                    errorView()
                }
            }
        }
        .onAppear {
            viewModel.doFetchCurrencySymbols()
            print(viewModel.currencySymbols)
        }
    }

    @ViewBuilder
    private func listCurrenciesView() -> some View {
        List(viewModel.searchResults, id: \.symbol) { item in
            Button {
                if selections.contains(item.symbol) {
                    selections.removeAll { $0 == item.symbol}
                } else {
                    selections.append(item.symbol)
                }
            } label: {
                HStack {
                    symbolView(item)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selections.contains(item.symbol) ? 1.0 : 0.0)
                }
                .foregroundStyle(.black)
            }
        }
        .searchable(text: $searchText, prompt: "Procurar moedas")
        .onChange(of: searchText) { searchText in
            if searchText.isEmpty {
                viewModel.searchResults = viewModel.currencySymbols
            } else {
                viewModel.searchResults = viewModel.currencySymbols.filter {
                    $0.symbol.contains(searchText.uppercased()) ||
                    $0.fullName.uppercased().contains(searchText.uppercased())
                }
            }
        }
        .navigationTitle("Filtrar Moedas")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                delegate?.didSelected(selections)
                dismiss()
            } label: {
                Text(selections.isEmpty ? "Cancelar": "OK")
                    .fontWeight(.bold)
            }
        }
    }

    @ViewBuilder
    private func symbolView(_ symbol: CurrencySymbolModel) -> some View {
        HStack {
            Text(symbol.symbol)
                .fontWeight(.bold)
            Text("-")
            Text(symbol.fullName)
        }
        .font(.system(size: 14, weight: .semibold))
    }

    @ViewBuilder
    private func errorView() -> some View {
        VStack {
            Spacer()

            Image(systemName: "wifi.exclamationmark")
                .resizable()
                .frame(width: 60, height: 44)
                .padding(.bottom, 4)

            Text("Ocorrey um erro na busca dos símbolos das moedas!")
                .font(.headline.bold())
                .multilineTextAlignment(.center)

            Button {
                viewModel.doFetchCurrencySymbols()
            } label: {
                Text("Tentar novamente")
            }
            .padding(.top, 4)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    MultiCurrenciesFilterView()
}
