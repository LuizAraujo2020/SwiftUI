//
//  RatesHistoricalDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation

protocol RatesHistoricalDataProviderDelegate: DataProviderManagerDelegate {
    func success(model: [RateHistoricalModel])
}

class RatesHistoricalDataProvider: DataProviderManager<RatesHistoricalDataProviderDelegate, [RateHistoricalModel]> {
    private let ratesStore: RatesStore

    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }

    func fetchTimeSeries(by base: String, from symbols: [String], startDate: String, endDate: String) {
        Task.init {
            do {
                let object = try await ratesStore.fetchTimeSeries(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: object.flatMap({ (period, rates) -> [RateHistoricalModel] in
                    return rates.map { RateHistoricalModel(symbol: $0, period: period.toDate(), endRate: $1) }
                }))
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
