//
//  RatesFluctuationDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation

protocol RatesFluctuationProviderDelegate: DataProviderManagerDelegate {
    func success(model: RatesFluctuationObject)
}

class RatesFluctuationDataProvider: DataProviderManager<RatesFluctuationProviderDelegate, RatesFluctuationObject> {
    private let ratesStore: RatesStore

    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }

    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String) {
        Task.init {
            do {
                let model = try await ratesStore.fetchFluctuation(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
