//
//  CurrencySelectionFilterViewModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import SwiftUI

class CurrencySelectionFilterViewModel: ObservableObject {
    @Published var symbols: [CurrencySymbolModel] = [
        CurrencySymbolModel(symbol: "BRL", fullName: "Brazilian Real"),
        CurrencySymbolModel(symbol: "EUR", fullName: "Euro"),
        CurrencySymbolModel(symbol: "GBP", fullName: "British Pound Sterling"),
        CurrencySymbolModel(symbol: "JPY", fullName: "Japanese Yen"),
        CurrencySymbolModel(symbol: "USD", fullName: "United States Dollar")
    ]
}
