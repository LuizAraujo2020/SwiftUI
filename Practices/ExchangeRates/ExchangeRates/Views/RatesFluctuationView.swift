//
//  RatesFluctuationView.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 18/09/23.
//

import SwiftUI

struct Fluctuation: Identifiable {
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
    var body: some View {
        NavigationView {
            VStack {
                baseCurrencyPeriodFilterView()
                ratesFluctuationListView()
            }
            .background(.red)
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
            VStack {
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
    private func filterButton(_ text: String, action: () -> Void) -> some View {
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
        List(viewModel.fluctuations) { fluctuation in
            VStack {
                HStack {
                    Text("\(fluctuation.symbol) / BRL")
                        .font((.system(size: 14, weight: .medium)))

                    Text("\(fluctuation.endRate)")
                        .font((.system(size: 14, weight: .bold)))

                    Text("\(fluctuation.change)")
                        .font((.system(size: 14, weight: .bold)))

                    Text("\(fluctuation.changePct)")
                        .font((.system(size: 14, weight: .bold)))
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
