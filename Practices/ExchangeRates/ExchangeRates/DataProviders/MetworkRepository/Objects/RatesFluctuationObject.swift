//
//  RatesFluctuationObject.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

typealias RatesFluctuationObject = [String: FluctuationObject]

struct FluctuationObject: Codable {
    let endRate: Double
    let change: Double
    let changePct: Double

    enum CodingKeys: String, CodingKey {
        case endRate = "end_rate"
        case change
        case changePct = "change_pct"
    }
}
