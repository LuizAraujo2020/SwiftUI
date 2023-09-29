//
//  RateFluctuationModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import Foundation

struct RateFluctuationModel: Identifiable, Equatable {
    let id = UUID()
    let symbol: String
    let change: Double
    let changePct: Double
    var endRate: Double
}

extension RateFluctuationModel {
    static let samples = [
        RateFluctuationModel(symbol: "USD", change: 0.0008, changePct: 0.4175, endRate: 0.18857),
        RateFluctuationModel(symbol: "EUR", change: 0.0003, changePct: 0.1651, endRate: 0.181353),
        RateFluctuationModel(symbol: "GBP", change: -0.0001, changePct: -0.0403, endRate: 0.158915)
    ]
}
