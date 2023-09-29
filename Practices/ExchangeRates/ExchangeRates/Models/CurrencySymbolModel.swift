//
//  CurrencySymbolModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import Foundation

struct CurrencySymbolModel: Identifiable, Equatable {
    let id = UUID()
    var symbol: String
    var fullName: String
}
