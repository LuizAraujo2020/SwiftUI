//
//  RatesFluctuationView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import SwiftUI

struct Fluctuation: Identifiable, Equatable {
    let id = UUID()
    let symbol: String
    let change: Double
    let changePct: Double
    var endRate: Double
}

extension Fluctuation {
    static let samples = [
        Fluctuation(symbol: "USD", change: 0.0008, changePct: 0.4175, endRate: 0.18857),
        Fluctuation(symbol: "EUR", change: 0.0003, changePct: 0.1651, endRate: 0.181353),
        Fluctuation(symbol: "GBP", change: -0.0001, changePct: -0.0403, endRate: 0.158915)
    ]
}

class FluctuationViewModel: ObservableObject {
    @Published var fluctuations: [Fluctuation] = Fluctuation.samples
}

struct RatesFluctuationView: View {
    @StateObject var viewModel = FluctuationViewModel()
    @State var searchText = ""

    var searchResult: [Fluctuation] {
        if searchText.isEmpty {
            return viewModel.fluctuations
        } else {
            return viewModel.fluctuations.filter {
                $0.symbol.contains(searchText.uppercased()) ||
                $0.endRate.formatter(decimalPlaces: 2).contains(searchText.uppercased()) ||
                $0.change.formatter(decimalPlaces: 4).contains(searchText.uppercased()) ||
                $0.changePct.formatter(decimalPlaces: 2).contains(searchText.uppercased())
            }
        }
    }
    var body: some View {
        NavigationView {
            VStack {
                baseCurrencyPeriodFilterView()
                ratesFluctuationListView()
            }
            .searchable(text: $searchText)
            .navigationTitle("Conversão de Moedas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    print("Filter moedas")
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
            }
        }
    }

    @ViewBuilder
    private func baseCurrencyPeriodFilterView() -> some View {
        HStack {
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
    private func ratesFluctuationListView() -> some View {
        List(searchResult) { fluctuation in
            NavigationLink {
                RatesFluctuationDetailView(baseCurrency: "BRL", rateFluctuation: fluctuation)
            } label: {
                VStack {
                    HStack(alignment: .center, spacing: 8) {
                        Text("\(fluctuation.symbol) / BRL")
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
}

struct RatesFluctuationView_Previews: PreviewProvider {
    static var previews: some View {
        RatesFluctuationView()
    }
}
