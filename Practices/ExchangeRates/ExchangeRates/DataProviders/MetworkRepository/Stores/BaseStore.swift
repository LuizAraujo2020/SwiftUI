//
//  BaseStore.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

class BaseStore {
    let error = NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Error getting information"]) as Error

    struct RateResult<Rates: Codable>: Codable {
        var base: String?
        var success: Bool = false
        var rates: Rates?

        init(data: Data?, response: URLResponse?) throws {
            guard let data = data, let response = response as? HTTPURLResponse
            else {
                throw NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Error gettting information"]) as Error
            }

            if let url = response.url?.absoluteString, let json = String(data: data, encoding: .utf8) {
                print("\(response.statusCode): \(url)")
                print("\(json)")
            }

            self = try JSONDecoder().decode(RateResult.self, from: data)
        }
    }

    struct SymbolResult<Rates: Codable>: Codable {
        var base: String?
        var success: Bool = false
        var symbols: CurrencySymbolsObject

        init(data: Data?, response: URLResponse?) throws {
            guard let data = data, let response = response as? HTTPURLResponse
            else {
                throw NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Error gettting information"]) as Error
            }

            if let url = response.url?.absoluteString, let json = String(data: data, encoding: .utf8) {
                print("\(response.statusCode): \(url)")
                print("\(json)")
            }

            self = try JSONDecoder().decode(SymbolResult.self, from: data)
        }
    }
}
