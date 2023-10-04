//
//  RateFluctuationViewModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import SwiftUI
import Combine

extension RatesFluctuationView {
    @MainActor class ViewModel: ObservableObject {
        enum ViewState {
            case start, loading, success, failure
        }

        @Published var ratesFluctuations = [RateFluctuationModel]()
        @Published var searchResults = [RateFluctuationModel]()
        @Published var timeRange = TimeRangeEnum.today
        @Published var baseCurrency = "BRL"
        @Published var currencies = [String]()
        @Published var currentState: ViewState = .start

        private let dataProvider: RatesFluctuationDataProvider?
        private var cancellables = Set<AnyCancellable>()

        init(dataProvider: RatesFluctuationDataProvider = RatesFluctuationDataProvider()) {
            self.dataProvider = dataProvider
        }

        func doFetchRatesFluctuation(timeRange: TimeRangeEnum) {
            currentState = .loading

            withAnimation {
                self.timeRange = timeRange
            }

            let startDate = timeRange.date.toString()
            let endDate = Date().toString()
            dataProvider?.fetchFluctuation(
                by: baseCurrency, 
                from: currencies,
                startDate: startDate,
                endDate: endDate)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        self.currentState = .success
                    case .failure(_):
                        self.currentState = .failure
                }
            }, receiveValue: { ratesFluctuations in
                withAnimation {
                    self.ratesFluctuations = ratesFluctuations.sorted { $0.symbol < $1.symbol }
                    self.searchResults = self.ratesFluctuations
                }
            }).store(in: &cancellables)
        }
    }
}
