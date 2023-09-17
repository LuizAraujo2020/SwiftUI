//
//  RatesAPI.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

struct RatesAPI {
    static let baseURL = "https://api.apilayer.com/exchangerates_data"
    static let apiKey = "620271889bde3aaaeaabb074b92e4d9f"
    static let fluctuation = "/fluctuation"
    static let symbols = "/symbols"
    static let timeSeries = "/timeseries"
}
