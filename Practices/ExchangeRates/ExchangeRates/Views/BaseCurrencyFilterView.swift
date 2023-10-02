//
//  BaseCurrencyFilterView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import SwiftUI

protocol BaseCurrencyFilterViewDelegate {
    func didSelected(_ baseCurrency: String)
}

struct BaseCurrencyFilterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ViewModel()

    @State private var selection: String?
    @State private var searchText = ""

    var delegate: BaseCurrencyFilterViewDelegate?

    var searchResult: [CurrencySymbolModel] {
        if searchText.isEmpty {
            return viewModel.currencySymbols
        } else {
            return viewModel.currencySymbols.filter {
                $0.symbol.contains(searchText.uppercased()) ||
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
        List(searchResult, id: \.symbol, selection: $selection) { symbol in
            symbolView(symbol)
        }
        .searchable(text: $searchText)
        .navigationTitle("Filtrar Moedas")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                guard let selection else { return }
                delegate?.didSelected(selection)
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
    BaseCurrencyFilterView()
}
