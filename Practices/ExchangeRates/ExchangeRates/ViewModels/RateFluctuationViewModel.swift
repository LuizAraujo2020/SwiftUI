//
//  RateFluctuationViewModel.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 27/09/23.
//

import Foundation

class RateFluctuationViewModel: ObservableObject {

    @Published var fluctuations: [RateFluctuationModel] = [
        .init(symbol: "JPY", change: 0.000_8, changePct: 0.000_5, endRate: 0.007242),
        .init(symbol: "EUR", change: 0.000_3, changePct: 0.1651, endRate: 0.181353),
        .init(symbol: "GBP", change: -0.000_1, changePct: -0.040_3, endRate: 0.158915)
    ]
    @Published var chartComparations: [RateHistoricalModel] = [
        .init(symbol: "USD", period: "2022-11-13".toDate(), endRate: 0.18857),
        .init(symbol: "USD", period: "2022-11-12".toDate(), endRate: 0.18857),
        .init(symbol: "USD", period: "2022-11-11".toDate(), endRate: 0.187786),
        .init(symbol: "USD", period: "2022-11-10".toDate(), endRate: 0.187073)
    ]
    @Published var timeRange = TimeRangeEnum.today

    var hasRates: Bool {
        chartComparations.filter { $0.endRate > 0 }.count > 0
    }
    var yAxisMin: Double {
        let min = chartComparations.map { $0.endRate }.min() ?? 0.0

        return (min - (min * 0.02))
    }
    var yAxisMax: Double {
        let max = chartComparations.map { $0.endRate }.max() ?? 0.0
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

    func addFluctuation(fluctuation: RateFluctuationModel) {
        fluctuations.insert(fluctuation, at: 0)
    }

    func removeFluctuation(fluctuation: RateFluctuationModel) {
        if let index = fluctuations.firstIndex(of: fluctuation) {
            fluctuations.remove(at: index)
        }
    }
}
