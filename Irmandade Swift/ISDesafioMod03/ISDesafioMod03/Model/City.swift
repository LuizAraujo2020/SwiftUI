//
//  City.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let abbreviation: String
    let lastDays: [Day]

    static let mock: [City] = [.init(name: "Central City",
                                     abbreviation: "CC",
                                     lastDays: Day.mock),
                               .init(name: "Zion",
                                     abbreviation: "ZI",
                                     lastDays: Day.mock),
                               .init(name: "Gotham City",
                                     abbreviation: "GC",
                                     lastDays: Day.mock)]
}
