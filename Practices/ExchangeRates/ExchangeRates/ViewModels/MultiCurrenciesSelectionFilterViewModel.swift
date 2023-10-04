//
//  MultiCurrenciesSelectionFilterViewModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 29/09/23.
//

import SwiftUI
import Combine

extension MultiCurrenciesFilterView {
    @MainActor class ViewModel: ObservableObject {
        enum ViewState {
            case start, loading, success, failure
        }
        @Published var currencySymbols = [CurrencySymbolModel]()
        @Published var searchResults = [CurrencySymbolModel]()
        @Published var currentState: ViewState = .start

        private let dataProvider: CurrencySymbolsDataProvider?
        private var cancellables = Set<AnyCancellable>()

        internal init(dataProvider: CurrencySymbolsDataProvider = CurrencySymbolsDataProvider()) {
            self.dataProvider = dataProvider
        }

        func doFetchCurrencySymbols() {
            currentState = .loading

            dataProvider?.fetchSymbols()
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .finished:
                            self.currentState = .success
                        case .failure(_):
                            self.currentState = .failure
                    }
                }, receiveValue: { currencySymbols in
                    withAnimation {
                        self.currencySymbols = currencySymbols.sorted { $0.symbol < $1.symbol }
                        self.searchResults = self.currencySymbols
                    }
                }).store(in: &cancellables)
        }
    }
}
