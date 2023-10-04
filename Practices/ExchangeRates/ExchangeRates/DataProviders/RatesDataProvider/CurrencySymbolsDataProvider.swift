//
//  CurrencySymbolsDataProvider.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation
import Combine

protocol CurrencySymbolsDataProviderProtocol {
    func fetchSymbols() -> AnyPublisher<[CurrencySymbolModel], Error>
}

class CurrencySymbolsDataProvider: CurrencySymbolsDataProviderProtocol {
    private let currencyStore: CurrencyStore

    init(currencyStore: CurrencyStore = CurrencyStore()) {
        self.currencyStore = currencyStore
    }

    func fetchSymbols() -> AnyPublisher<[CurrencySymbolModel], Error> {
        return Future { promise in
            DispatchQueue.main.async {
                self.currencyStore.fetchSymbols { result, failure in
                    if let failure {
                        return promise(.failure(failure))
                    }

                    guard let symbols = result?.symbols else {
                        return // TODO: promise(.failure(failure)) - passar pra viewModel
                    }

                    let currenciesSymbol = symbols.map({ (key, value) -> CurrencySymbolModel in
                        return CurrencySymbolModel(symbol: key, fullName: value)
                    })

                    return promise(.success(currenciesSymbol))
                }
            }
        }.eraseToAnyPublisher()
    }
}
