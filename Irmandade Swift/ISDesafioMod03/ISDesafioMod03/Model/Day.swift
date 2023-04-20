//
//  Day.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import Foundation

struct Day: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    let condition: WeatherConditions
    let temperature: Double

    func getFormattedTemp() -> String {
        String(format: "%.1fº", temperature)
    }

    func getFormattedTemp(_ temp: Double) -> String {
        String(format: "%.1fº", temp)
    }

    static let mock: [Day] = [.init(dayOfWeek: "Seg",
                                    condition: .rainy,
                                    temperature: 27),
                              .init(dayOfWeek: "Ter",
                                    condition: .sunny,
                                    temperature: 32.6),
                              .init(dayOfWeek: "Qua",
                                    condition: .sunny,
                                    temperature: 34),
                              .init(dayOfWeek: "Qui",
                                    condition: .rainy,
                                    temperature: 28.1),
                              .init(dayOfWeek: "Sex",
                                    condition: .rainy,
                                    temperature: 27.9),
                              .init(dayOfWeek: "Sáb",
                                    condition: .rainy,
                                    temperature: 28.2),
                              .init(dayOfWeek: "Dom",
                                    condition: .sunny,
                                    temperature: 30.4)]
}
