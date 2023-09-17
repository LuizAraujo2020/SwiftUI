//
//  CurrencyRouter.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

enum CurrencyRouter {
    case symbols

    var path: String {
        switch self {
            case .symbols: return RatesAPI.symbols
        }
    }

    func asURLRequest() throws -> URLRequest? {
        guard var url = URL(string: RatesAPI.baseURL) else { return nil }

        switch self {
            case .symbols:
                var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
                request.httpMethod = HTTPMethod.get.rawValue
                request.addValue(RatesAPI.apiKey, forHTTPHeaderField: "apikey")

                return request
        }
    }
}
