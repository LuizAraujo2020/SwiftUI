//
//  CurrencySymbolsDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation

protocol CurrencySymbolsDataProviderDelegate: DataProviderManagerDelegate {
    func success(model: CurrencySymbolsObject)
}

class CurrencySymbolsDataProvider: DataProviderManager<CurrencySymbolsDataProviderDelegate, CurrencySymbolsObject> {
    private let currencyStore: CurrencyStore

    init(currencyStore: CurrencyStore = CurrencyStore()) {
        self.currencyStore = currencyStore
    }

    func fetchSymbols(by base: String, from symbols: [String], startDate: String, endDate: String) {
        Task.init {
            do {
                let model = try await currencyStore.fetchSymbols()
                delegate?.success(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
