//
//  CurrencySymbolObject.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 17/09/23.
//

import Foundation

struct CurrencySymbolObject: Codable {
    var base: String?
    var success: Bool = false
    var symbols: SymbolObject?
}

typealias SymbolObject = [String: String]
