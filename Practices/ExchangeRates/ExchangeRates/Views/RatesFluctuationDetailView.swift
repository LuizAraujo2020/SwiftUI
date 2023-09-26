//
//  RatesFluctuationDetailView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 19/09/23.
//

import SwiftUI
import Charts

struct ChartComparation: Identifiable, Equatable {
    let id = UUID()
    var symbol: String
    var period: Date
    var endRate: Double
}

class RateFluctuationViewModel: ObservableObject {

    @Published var fluctuations: [Fluctuation] = [
        .init(symbol: "JPY", change: 0.000_8, changePct: 0.000_5, endRate: 0.007242),
        .init(symbol: "EUR", change: 0.000_3, changePct: 0.1651, endRate: 0.181353),
        .init(symbol: "GBP", change: -0.000_1, changePct: -0.040_3, endRate: 0.158915)
    ]
    @Published var chartComparations: [ChartComparation] = [
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

    func addFluctuation(fluctuation: Fluctuation) {
        fluctuations.insert(fluctuation, at: 0)
    }

    func removeFluctuation(fluctuation: Fluctuation) {
        if let index = fluctuations.firstIndex(of: fluctuation) {
            fluctuations.remove(at: index)
        }
    }
}

struct RatesFluctuationDetailView: View {
    @StateObject var viewModel = RateFluctuationViewModel()
    @State var baseCurrency: String
    @State var rateFluctuation: Fluctuation

    var body: some View {
        ScrollView(showsIndicators: false) {
            valuesView()
            graphicChartView()
        }
        .navigationTitle("BRL a EUR")
    }

    @ViewBuilder
    private func valuesView() -> some View {
        HStack(spacing: 8) {
            Text(rateFluctuation.endRate.formatter(decimalPlaces: 4))
                .font(.system(size: 28, weight: .bold))

            Text(rateFluctuation.changePct.toPercentage(with: true))
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(rateFluctuation.changePct.color)
                .background(rateFluctuation.changePct.color.opacity(0.2))

            Text(rateFluctuation.change.formatter(decimalPlaces: 4, with: true))
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(rateFluctuation.changePct.color)

            Spacer()
        }
        .padding(8)
    }

    @ViewBuilder
    private func graphicChartView() -> some View {
        VStack {
            periodoFilterView()
            lineChartView()
        }
    }

    @ViewBuilder
    private func periodoFilterView() -> some View {
        HStack(spacing: 16) {
            Button {
                print("Filtrar moeda base")
            } label: {
                Text("BRL")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 1)
                    )
            }
            .background(Color(UIColor.lightGray))
            .cornerRadius(8)

            filterButton("1 dia") {}
            filterButton("7 dias") {}
            filterButton("1 mês") {}
            filterButton("6 meses") {}
            filterButton("1 ano") {}
        }
    }

    @ViewBuilder
    private func filterButton(_ text: String, action: @escaping () -> Void) -> some View {
        Button {
            print(text)
            action()
        } label: {
            Text(text)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray)
        }
    }

    @ViewBuilder
    private func lineChartView() -> some View {
        Chart(viewModel.chartComparations) { item in
            LineMark(
                x: .value("Period", item.period),
                y: .value("Rates", item.endRate))
        }
        .chartXAxis {
            AxisMarks(preset: .aligned) { date in
                AxisGridLine()
                AxisValueLabel(viewModel.xAxisLabelFormatStyle(for: date.as(Date.self) ?? Date()))
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading) { rate in
                AxisGridLine()
                AxisValueLabel(rate.as(Double.self)?.formatter(decimalPlaces: 3) ?? 0.0.formatter(decimalPlaces: 3))
            }
        }
        .chartYScale(domain: viewModel.yAxisMin...viewModel.yAxisMax)
        .frame(height: 260)
        .padding(.trailing, 22)
    }
}

#Preview {
    RatesFluctuationDetailView(baseCurrency: "BRL", rateFluctuation: .init(symbol: "EUR", change: 0.000_3, changePct: 0.1651, endRate: 0.181353))
}
