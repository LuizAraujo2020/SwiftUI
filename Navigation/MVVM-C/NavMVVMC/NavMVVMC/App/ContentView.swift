//
//  ContentView.swift
//  NavMVVMC
//
//  Created by Luiz Araujo on 14/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build()
                .navigationDestination(for: UserFlowCoordinator.self) { coordinator in
                    coordinator.build()
                }
                .navigationDestination(for: SettingsFlowCoordinator.self) { coordinator in
                    coordinator.build()
                }
                .navigationDestination(for: ProfileFlowCoordinator.self) { coordinator in
                    coordinator.build()
                }
        }
        .environmentObject(appCoordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
