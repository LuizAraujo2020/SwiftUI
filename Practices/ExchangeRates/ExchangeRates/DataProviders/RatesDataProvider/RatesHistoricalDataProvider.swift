//
//  RatesHistoricalDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation
import Combine

protocol RatesHistoricalDataProviderProtocol {
    func fetchTimeSeries(by base: String, from symbol: String, startDate: String, endDate: String) -> AnyPublisher<[RateHistoricalModel], Error>
}

class RatesHistoricalDataProvider: RatesHistoricalDataProviderProtocol {
    private let ratesStore: RatesStore

    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }

    func fetchTimeSeries(by base: String, from symbol: String, startDate: String, endDate: String) -> AnyPublisher<[RateHistoricalModel], Error> {
        return Future { promise in
            DispatchQueue.main.async {
                self.ratesStore.fetchTimeSeries(by: base, from: symbol, startDate: startDate, endDate: endDate) { result, failure in
                    if let failure {
                        return promise(.failure(failure))
                    }

                    guard let rates = result?.rates else {
                        return // TODO: promise(.failure(failure)) - passar pra viewModel
                    }

                    let ratesHistorical = rates.flatMap({ (key, rates) -> [RateHistoricalModel] in
                        return rates.map { RateHistoricalModel(symbol: $0, period: key.toDate(), endRate: $1) }
                    })

                    return promise(.success(ratesHistorical))
                }
            }
        }.eraseToAnyPublisher()
    }
}
