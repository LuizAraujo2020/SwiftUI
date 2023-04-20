//
//  ContentViewModel.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import Foundation

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var isDarkMode       = false
        @Published var appearanceAuto   = false
        @Published var isBold           = false
        @Published var textSize         = 1.0
        @Published var brightness       = 0.5
        @Published var trueToneEnabled  = false
        @Published var appearanceToggle = false

        func setSchemeAuto() {
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH"
            let timestamp = Int(formatter.string(from: now))

            guard let timestamp else { return }


            if timestamp > 6 && timestamp < 18 {
                isDarkMode = false

            } else {
                isDarkMode = true
            }
        }
    }
}
