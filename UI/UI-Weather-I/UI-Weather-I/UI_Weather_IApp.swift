//
//  UI_Weather_IApp.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

@main
struct UI_Weather_IApp: App {
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            MainView(viewModel: mainViewModel)
                .onAppear {
                    mainViewModel.fetch()
                }
        }
    }
}
