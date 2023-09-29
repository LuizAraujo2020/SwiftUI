//
//  BaseCurrencyFilterViewModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import SwiftUI

extension BaseCurrencyFilterView {
    @MainActor class ViewModel: ObservableObject, CurrencySymbolsDataProviderDelegate {
        @Published var currencySymbols = [CurrencySymbolModel]()

        private let dataProvider: CurrencySymbolsDataProvider?

        internal init(dataProvider: CurrencySymbolsDataProvider = CurrencySymbolsDataProvider()) {
            self.dataProvider = dataProvider
            self.dataProvider?.delegate = self
        }

        func doFetchCurrencySymbols() {
            dataProvider?.fetchSymbols()
            print(currencySymbols)
        }

        nonisolated func success(model: [CurrencySymbolModel]) {
            DispatchQueue.main.async {
                self.currencySymbols = model.sorted { $0.symbol < $1.symbol }
            }
        }
    }
}
