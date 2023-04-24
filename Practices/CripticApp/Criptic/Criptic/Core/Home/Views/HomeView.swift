//
//  HomeView.swift
//  Criptic
//
//  Created by Luiz Araujo on 20/04/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject vm: HomeViewModel
    
    @State private var showPortfolio = false
    
    let coin: CoinModel
    
    var body: some View {
        ZStack {
            /// Background Layer
            Color.theme.background
                .ignoresSafeArea()
            
            /// Content Layer
            VStack {
                homeHeader()
                
                List {
                    CoinRowView(
                        coin: coin,
                        showHoldingsColumn: false)
                }
                .listStyle(.plain)
                Spacer(minLength: 0)
            }
        }
        .animation(.spring(), value: showPortfolio)
    }
}

extension HomeView {
    @ViewBuilder
    private func homeHeader() -> some View {
        HStack {
            CircleButtonView(symbol: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            
            Spacer()
            
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none, value: showPortfolio)
            
            Spacer()
            
            CircleButtonView(symbol: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    showPortfolio.toggle()
                }
        }
        .padding(.horizontal)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationStack {
            HomeView(coin: Mocks.mockCoin)
                .toolbar(.hidden)
                .environmentObject(HomeViewModel())
        }
    }
}
