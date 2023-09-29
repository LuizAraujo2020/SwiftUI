//
//  RatesFluctuationDetailView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 19/09/23.
//

import SwiftUI
import Charts

struct RatesFluctuationDetailView: View {
    @StateObject var viewModel = RateFluctuationViewModel()
    @State var baseCurrency: String
    @State var rateFluctuation: RateFluctuationModel

    @State private var isPresentedBaseCurrencyFilter = false
    @State private var isPresentedMultiCurrenciesFilter = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            valuesView()
            graphicChartView()
            comparationView()
        }
        .padding(.horizontal, 8)
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
        .padding(.vertical, 8)
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
            .interpolationMethod(.catmullRom)

            if !viewModel.hasRates {
                RuleMark(y: .value("Conversão Zero", 0))
                    .annotation(position: .overlay, alignment: .center) {
                        Text("Sem valores nesse período")
                            .font(.footnote)
                            .padding()
                            .background(Color(UIColor.systemBackground))
                    }
            }
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
        .padding(.trailing, 18)
    }

    @ViewBuilder
    private func comparationView() -> some View {
        VStack(spacing: 8) {
            comparationButtonView()
            comparationScrollView()
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private func comparationButtonView() -> some View {
        Button {
            isPresentedBaseCurrencyFilter.toggle()
        } label: {
            Image(systemName: "magnifyingglass")
            Text("Comparar com")
                .font(.system(size: 16))
        }
        .fullScreenCover(isPresented: $isPresentedBaseCurrencyFilter, content: {
            BaseCurrencyFilterView()
        })
    }

    @ViewBuilder
    private func comparationScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], alignment: .center) {
                ForEach(viewModel.fluctuations) { fluctuation in
                    Button {
                        print("Comparacao")
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(fluctuation.symbol) / \(baseCurrency)")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.black)
                            Text(fluctuation.endRate.formatter(decimalPlaces: 4))
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(Color.black)

                            HStack(alignment: .bottom, spacing: 60) {
                                Text(fluctuation.symbol)
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundStyle(Color.gray)
                                Text(fluctuation.changePct.toPercentage())
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(fluctuation.changePct.color)
//                                    .frame(width: .infinity, alignment: .trailing)
                            }
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    RatesFluctuationDetailView(baseCurrency: "BRL", rateFluctuation: .init(symbol: "EUR", change: 0.000_3, changePct: 0.1651, endRate: 0.181353))
}
