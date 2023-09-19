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
}

struct RatesFluctuationView_Previews: PreviewProvider {
    static var previews: some View {
        RatesFluctuationView()
    }
}
