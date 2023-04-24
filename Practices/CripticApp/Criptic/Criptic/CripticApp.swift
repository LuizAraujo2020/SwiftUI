//
//  CripticApp.swift
//  Criptic
//
//  Created by Luiz Araujo on 20/04/23.
//

import SwiftUI

@main
struct CripticApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(coin: Mocks.mockCoin)
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
