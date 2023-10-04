//
//  RatesFluctuationDetailView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 19/09/23.
//

import SwiftUI
import Charts

struct RatesFluctuationDetailView: View {
    @StateObject var viewModel = ViewModel()
    @State var baseCurrency: String
    @State var fromCurrency: String

    @State private var isPresentedBaseCurrencyFilter = false
    @State private var isPresentedMultiCurrenciesFilter = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            valuesView()
            graphicChartView()
            comparationView()
        }
        .padding(.horizontal, 8)
        .navigationTitle(viewModel.title)

        .onAppear {
            viewModel.startStateView(
                baseCurrency: baseCurrency,
                fromCurrency: fromCurrency,
                timeRange: .today)
        }
    }

    @ViewBuilder
    private func valuesView() -> some View {
        HStack(spacing: 8) {
            Text(viewModel.endRate.formatter(decimalPlaces: 4))
                .font(.system(size: 22, weight: .bold))

            Text(viewModel.changePct.toPercentage(with: true))
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(viewModel.changePct.color)
                .background(viewModel.changePct.color.opacity(0.2))

            Text(viewModel.changeDescription)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(viewModel.changePct.color)

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

            filterButton("1 dia", .today) {
                viewModel.doFetchData(from: .today)
            }
            filterButton("7 dias", .thisWeek) {
                viewModel.doFetchData(from: .thisWeek)
            }
            filterButton("1 mês", .thisMonth) {
                viewModel.doFetchData(from: .thisMonth)
            }
            filterButton("6 meses", .thisSemester) {
                viewModel.doFetchData(from: .thisSemester)
            }
            filterButton("1 ano", .thisYear) {
                viewModel.doFetchData(from: .thisYear)
            }
        }
    }

    @ViewBuilder
    private func filterButton(_ text: String, _ timeRange: TimeRangeEnum, action: @escaping () -> Void) -> some View {
        Button {
            print(text)
            action()
        } label: {
            Text(text)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(viewModel.timeRange == timeRange ? .blue : .gray)
                .underline(viewModel.timeRange == timeRange)
        }
    }

    @ViewBuilder
    private func lineChartView() -> some View {
        Chart(viewModel.ratesHistorical) { item in
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
            AxisMarks(preset: .aligned, values: .stride(by: viewModel.xAxisStride, count: viewModel.xAxisStrideCount)) { date in
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
            BaseCurrencyFilterView(delegate: self)
        })
        .opacity(viewModel.ratesFluctuation.count == 0 ? 0.0 : 1.0)
    }

    @ViewBuilder
    private func comparationScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], alignment: .center) {
                ForEach(viewModel.ratesFluctuation) { fluctuation in
                    Button {
                        viewModel.doComparation(with: fluctuation)
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

extension RatesFluctuationDetailView: BaseCurrencyFilterViewDelegate {
    func didSelected(_ baseCurrency: String) {
        viewModel.doFilter(by: baseCurrency)
    }
}

#Preview {
    RatesFluctuationDetailView(baseCurrency: "BRL", fromCurrency: "USD")
}
