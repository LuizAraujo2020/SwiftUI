//
//  RatesHistoricalDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation

protocol RatesHistoricalDataProviderDelegate: DataProviderManagerDelegate {
    func success(model: RatesHistoricalObject)
}

class RatesHistoricalDataProvider: DataProviderManager<RatesHistoricalDataProviderDelegate, RatesHistoricalObject> {
    private let ratesStore: RatesStore

    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }

    func fetchTimeSeries(by base: String, from symbols: [String], startDate: String, endDate: String) {
        Task.init {
            do {
                let model = try await ratesStore.fetchTimeSeries(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
