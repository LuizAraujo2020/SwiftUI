//
//  RateHistoricalModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import Foundation

struct RateHistoricalModel: Identifiable, Equatable {
    let id = UUID()
    var symbol: String
    var period: Date
    var endRate: Double
}
