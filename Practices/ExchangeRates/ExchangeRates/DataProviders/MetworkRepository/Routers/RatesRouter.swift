//
//  RatesRouter.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

enum RatesRouter {
    case fluctuation(base: String, symbols: [String], startDate: String, endDate: String)
    case timeSeries(base: String, symbols: [String], startDate: String, endDate: String)

    var path: String {
        switch self {
            case .fluctuation: return RatesAPI.fluctuation
            case .timeSeries: return RatesAPI.timeSeries
        }
    }

    func asURLRequest() throws -> URLRequest? {
        guard var url = URL(string: RatesAPI.baseURL) else { return nil }

        switch self {
            case .fluctuation(let base, let symbols, let startDate, let endDate):
                url.append(queryItems: [
                    URLQueryItem(name: "base", value: base),
                    URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
                    URLQueryItem(name: "start_date", value: startDate),
                    URLQueryItem(name: "end_date", value: endDate)
                ])
            case .timeSeries(let base, let symbols, let startDate, let endDate):
                url.append(queryItems: [
                    URLQueryItem(name: "base", value: base),
                    URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
                    URLQueryItem(name: "start_date", value: startDate),
                    URLQueryItem(name: "end_date", value: endDate)
                ])
        }

        var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue(RatesAPI.apiKey, forHTTPHeaderField: "apikey")

        return request
    }
}
