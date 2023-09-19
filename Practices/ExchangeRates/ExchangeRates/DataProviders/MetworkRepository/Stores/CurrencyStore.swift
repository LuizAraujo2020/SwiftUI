//
//  CurrencyStore.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import Foundation

protocol CurrencyStoreProtocol {
    func fetchSymbols() async throws -> CurrencySymbolsObject
}

class CurrencyStore: BaseStore, CurrencyStoreProtocol {
    func fetchSymbols() async throws -> CurrencySymbolsObject {
        guard let urlRequest = try CurrencyRouter.symbols.asURLRequest() else { throw error }
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let symbols = try SymbolResult(data: data, response: response).symbols else { throw error }
        return symbols
    }
}
