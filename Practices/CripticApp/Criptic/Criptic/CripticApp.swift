//
//  CripticApp.swift
//  Criptic
//
//  Created by Luiz Araujo on 20/04/23.
//

import SwiftUI

@main
struct CripticApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
