//
//  RatesFluctuationView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import SwiftUI

struct RatesFluctuationView: View {
    @StateObject var viewModel = ViewModel()
    
    @State private var viewDidLoad = true
    @State private var searchText = ""
    @State private var isPresentedBaseCurrencyFilter = false
    @State private var isPresentedMultiCurrenciesFilter = false

    var body: some View {
        NavigationView {
            VStack {
                if case .loading = viewModel.currentState {
                    ProgressView()
                        .scaleEffect(2.2, anchor: .center)
                } else if case .success = viewModel.currentState {
                    baseCurrencyPeriodFilterView()
                    ratesFluctuationListView()
                } else if case .success = viewModel.currentState {
                    errorView()
                }
            }
            .searchable(text: $searchText, prompt: "Procurar moedas")
            .onChange(of: searchText) { searchText in
                if searchText.isEmpty {
                    viewModel.searchResults = viewModel.ratesFluctuations
                } else {
                    viewModel.searchResults = viewModel.ratesFluctuations.filter {
                        $0.symbol.contains(searchText.uppercased()) ||
                        $0.change.formatter(decimalPlaces: 6).contains(searchText) ||
                        $0.changePct.formatter(decimalPlaces: 6).contains(searchText)
                        $0.endRate.formatter(decimalPlaces: 6).contains(searchText) ||
                    }
                }
            }
            .navigationTitle("Conversão de Moedas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    isPresentedMultiCurrenciesFilter.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
                .fullScreenCover(isPresented: $isPresentedMultiCurrenciesFilter, content: {
                    MultiCurrenciesFilterView(delegate: self)
                })
            }
        }
        .onAppear {
            if viewDidLoad {
                viewDidLoad.toggle()
                viewModel.doFetchRatesFluctuation(timeRange: .today)
            }
        }
    }

    @ViewBuilder
    private func baseCurrencyPeriodFilterView() -> some View {
        HStack(spacing: 16) {
            Button {
                isPresentedBaseCurrencyFilter.toggle()
            } label: {
                Text(viewModel.baseCurrency)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 1)
                    )
            }
            .fullScreenCover(isPresented: $isPresentedBaseCurrencyFilter, content: {
                BaseCurrencyFilterView(delegate: self)
            })
            .background(Color(UIColor.lightGray))
            .cornerRadius(8)

            filterButton("1 dia", .today) {
                viewModel.doFetchRatesFluctuation(timeRange: .today)
            }

            filterButton("7 dias", .thisWeek) {
                viewModel.doFetchRatesFluctuation(timeRange: .thisWeek)
            }

            filterButton("1 mês", .thisMonth) {
                viewModel.doFetchRatesFluctuation(timeRange: .thisMonth)
            }

            filterButton("6 meses", .thisSemester) {
                viewModel.doFetchRatesFluctuation(timeRange: .thisSemester)
            }

            filterButton("1 ano", .thisYear) {
                viewModel.doFetchRatesFluctuation(timeRange: .thisYear)
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
    private func ratesFluctuationListView() -> some View {
        List(viewModel.searchResults) { fluctuation in
            NavigationLink {
                RatesFluctuationDetailView(baseCurrency: viewModel.baseCurrency, rateFluctuation: fluctuation)
            } label: {
                VStack {
                    HStack(alignment: .center, spacing: 8) {
                        Text("\(fluctuation.symbol) / \(viewModel.baseCurrency)")
                            .font((.system(size: 14, weight: .medium)))

                        Text(fluctuation.endRate.formatter(decimalPlaces: 2))
                            .font((.system(size: 14, weight: .bold)))
                            .frame(maxWidth: .infinity, alignment: .trailing)

                        Text(fluctuation.change.formatter(decimalPlaces: 4, with: true))
                            .font((.system(size: 14, weight: .bold)))
                            .foregroundColor(fluctuation.change.color)

                        Text(fluctuation.changePct.toPercentage())
                            .font((.system(size: 14, weight: .bold)))
                            .foregroundColor(fluctuation.changePct.color)
                    }
                    Divider()
                        .padding(.leading, -20)
                        .padding(.trailing, -40)
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.white)
        }
        .listStyle(.plain)
    }

    @ViewBuilder
    private func errorView() -> some View {
        VStack {
            Spacer()

            Image(systemName: "wifi.exclamationmark")
                .resizable()
                .frame(width: 60, height: 44)
                .padding(.bottom, 4)

            Text("Ocorrey um erro na busca da flutuação de taxas!")
                .font(.headline.bold())
                .multilineTextAlignment(.center)

            Button {
                viewModel.doFetchRatesFluctuation(timeRange: .today)
            } label: {
                Text("Tentar novamente")
            }
            .padding(.top, 4)

            Spacer()
        }
        .padding()
    }
}

extension RatesFluctuationView: BaseCurrencyFilterViewDelegate {
    func didSelected(_ baseCurrency: String) {
        viewModel.baseCurrency = baseCurrency
        viewModel.doFetchRatesFluctuation(timeRange: .today)
    }
}

extension RatesFluctuationView: MultiCurrenciesFilterViewDelegate {
    func didSelected(_ currencies: [String]) {
        viewModel.currencies = currencies
        viewModel.doFetchRatesFluctuation(timeRange: .today)
    }
}

struct RatesFluctuationView_Previews: PreviewProvider {
    static var previews: some View {
        RatesFluctuationView()
    }
}
