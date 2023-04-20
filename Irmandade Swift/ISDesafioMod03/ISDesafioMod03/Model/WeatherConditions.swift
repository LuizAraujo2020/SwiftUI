//
//  WeatherConditions.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

enum WeatherConditions: CaseIterable {
    case rainy, sunny

    @ViewBuilder
    func getSymbol(background: Color = .clear, size: CGFloat = 50) -> some View {
        ZStack {
            background

            switch self {
                case .rainy:
                    Image(systemName: "cloud.bolt.rain.fill")
                        .symbolRenderingMode(.multicolor)
                case .sunny:
                    Image(systemName: "cloud.sun.fill")
                        .symbolRenderingMode(.multicolor)
            }
        }
        .frame(width: size, height: size)
    }
}
