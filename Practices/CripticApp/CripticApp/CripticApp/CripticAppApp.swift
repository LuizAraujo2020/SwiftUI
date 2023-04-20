//
//  CripticAppApp.swift
//  CripticApp
//
//  Created by Luiz Araujo on 20/04/23.
//

import SwiftUI

@main
struct CripticAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
