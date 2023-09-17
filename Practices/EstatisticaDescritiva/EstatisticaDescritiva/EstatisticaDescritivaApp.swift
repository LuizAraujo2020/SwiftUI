//
//  EstatisticaDescritivaApp.swift
//  EstatisticaDescritiva
//
//  Created by Luiz Araujo on 22/08/23.
//

import SwiftUI

@main
struct EstatisticaDescritivaApp: App {
//    let persistenceController = PersistenceController.shared
    @StateObject var vm = MainViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            MainView()
                .environmentObject(vm)
        }
    }
}
