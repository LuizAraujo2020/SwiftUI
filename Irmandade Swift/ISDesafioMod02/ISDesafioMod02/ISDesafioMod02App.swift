//
//  ISDesafioMod02App.swift
//  ISDesafioMod02
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

@main
struct ISDesafioMod02App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(columnsContent: TypeOfColumn.allCases)
        }
    }
}
