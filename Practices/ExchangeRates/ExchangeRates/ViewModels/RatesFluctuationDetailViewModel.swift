//
//  RatesFluctuationDetailViewModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 02/10/23.
//

import SwiftUI

extension RatesFluctuationDetailView {
    @MainActor class ViewModel: ObservableObject, RatesFluctuationDataProviderDelegate, RatesHistoricalDataProviderDelegate {
        
        @Published var ratesFluctuation = [RateFluctuationModel]()
        @Published var ratesHistorical = [RateHistoricalModel]()
        @Published var timeRange = TimeRangeEnum.today
        @Published var baseCUrrency: String?
        @Published var rateFluctuation: RateFluctuationModel?

        private var fluctuationDataProvider: RatesFluctuationDataProvider?
        private var historicalDataProvider: RatesHistoricalDataProvider?

        var title: String {
            return "\(baseCUrrency ?? "") a \(symbol)"
        }
        var symbol: String {
            return rateFluctuation?.symbol ?? ""
        }
        var endRate: Double {
            return rateFluctuation?.endRate ?? 0.0
        }
        var change: Double {
            return rateFluctuation?.change ?? 0.0
        }
        var changePct: Double {
            return rateFluctuation?.changePct ?? 0.0
        }
        var changeDescription: String {
            switch timeRange {
                case .today:
                    return "\(change.formatter(decimalPlaces: 4, with: true)) 1 dia"
                case .thisWeek:
                    return "\(change.formatter(decimalPlaces: 4, with: true)) 7 dias"
                case .thisMonth:
                    return "\(change.formatter(decimalPlaces: 4, with: true)) 1 mês"
                case .thisSemester:
                    return "\(change.formatter(decimalPlaces: 4, with: true)) 6 meses"
                case .thisYear:
                    return "\(change.formatter(decimalPlaces: 4, with: true)) 1 ano"
            }
        }

        var hasRates: Bool {
            ratesHistorical.filter { $0.endRate > 0 }.count > 0
        }
        var yAxisMin: Double {
            let min = ratesHistorical.map { $0.endRate }.min() ?? 0.0
            return (min - (min * 0.02))
        }
        var yAxisMax: Double {
            let max = ratesHistorical.map { $0.endRate }.max() ?? 0.0
            return (max + (max * 0.02))
        }

        func xAxisLabelFormatStyle(for date: Date) -> String {
            switch timeRange {
                case .today: return date.formatter(to: "HH:mm")
                case .thisWeek, .thisMonth: return date.formatter(to: "dd, MM")
                case .thisSemester: return date.formatter(to: "MMM")
                case .thisYear: return date.formatter(to: "MMM, YYYY")
            }
        }

//        func addFluctuation(fluctuation: RateFluctuationModel) {
//            ratesHistorical.insert(fluctuation, at: 0)
//        }
//
//        func removeFluctuation(fluctuation: RateFluctuationModel) {
//            if let index = fluctuations.firstIndex(of: fluctuation) {
//                ratesHistorical.remove(at: index)
//            }
//        }

        init(fluctuationDataProvider: RatesFluctuationDataProvider = RatesFluctuationDataProvider(),
             historicalDataProvider: RatesHistoricalDataProvider = RatesHistoricalDataProvider()
        ) {
            self.fluctuationDataProvider = fluctuationDataProvider
            self.historicalDataProvider = historicalDataProvider

            self.fluctuationDataProvider?.delegate = self
            self.historicalDataProvider?.delegate = self
        }
    }

    nonisolated func success(model: [RateFluctuationModel]) {
        DispatchQueue.main.async {
            self.rateFluctuation = model. fil
        }
    }

    nonisolated func success(model: [RateHistoricalModel]) {
        DispatchQueue.main.async {
            self.RateHistoricalModel = model
        }
    }
}
