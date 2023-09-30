//
//  MultiCurrenciesSelectionFilterView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import SwiftUI

struct MultiCurrenciesSelectionFilterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ViewModel()

    @State private var searchText = ""
    @State private var selections = [String]()

    var searchResult: [CurrencySymbolModel] {
        if searchText.isEmpty {
            return viewModel.currencySymbols
        } else {
            return viewModel.currencySymbols.filter {
                $0.symbol.uppercased().contains(searchText.uppercased()) ||
                $0.fullName.uppercased().contains(searchText.uppercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            listCurrenciesView()
        }
        .onAppear {
            viewModel.doFetchCurrencySymbols()
            print(viewModel.currencySymbols)
        }
    }

    @ViewBuilder
    private func listCurrenciesView() -> some View {
        List(searchResult, id: \.symbol) { item in
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
        .searchable(text: $searchText)
        .navigationTitle("Filtrar Moedas")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                dismiss()
            } label: {
                Text("OK")
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
}

#Preview {
    MultiCurrenciesSelectionFilterView()
}
