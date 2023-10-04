//
//  RatesFluctuationDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Combine

protocol RatesFluctuationDataProviderProtocol {
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String) -> AnyPublisher<[RateFluctuationModel], Error>
}

class RatesFluctuationDataProvider: RatesFluctuationDataProviderProtocol {
    private let ratesStore: RatesStore

    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }

    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String) -> AnyPublisher<[RateFluctuationModel], Error> {
        return Future { promise in
            self.ratesStore.fetchFluctuation(by: base, from: symbols, startDate: startDate, endDate: endDate) { result, failure in
                if let failure {
                    return promise(.failure(failure))
                }

                guard let rates = result?.rates else { 
                    return // TODO: promise(.failure(failure)) - passar pra viewModel
                }
                
                let ratesFluction = rates.map({ (symbol, fluctuation) -> RateFluctuationModel in
                    return RateFluctuationModel(
                        symbol: symbol,
                        change: fluctuation.change,
                        changePct: fluctuation.changePct, endRate: fluctuation.endRate)
                })

                return promise(.success(ratesFluction))
            }
        }.eraseToAnyPublisher()
    }
}
