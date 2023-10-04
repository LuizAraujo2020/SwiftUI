//
//  RateStore.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

protocol RatesStoreProtocol: GenericStoreProtocol {
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String,
                          completion: @escaping completion<RateObject<RatesFluctuationObject>?>)
    func fetchTimeSeries(by base: String, from symbol: String, startDate: String, endDate: String,
                         completion: @escaping completion<RateObject<RatesHistoricalObject>?>)
}

class RatesStore: GenericStoreRequest, RatesStoreProtocol {
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String,
                          completion: @escaping completion<RateObject<RatesFluctuationObject>?>) {
        guard let urlRequest = RatesRouter.fluctuation(base: base, symbols: symbols, startDate: startDate, endDate: endDate).asURLRequest() else {
            return completion(nil, error)
        }
        request(urlRequest: urlRequest, completion: completion)
    }

    func fetchTimeSeries(by base: String, from symbol: String, startDate: String, endDate: String,
                         completion: @escaping completion<RateObject<RatesHistoricalObject>?>) {
        guard let urlRequest = RatesRouter.timeSeries(base: base, symbol: symbol, startDate: startDate, endDate: endDate).asURLRequest() else {
            return completion(nil, error)
        }
        request(urlRequest: urlRequest, completion: completion)
    }
}
