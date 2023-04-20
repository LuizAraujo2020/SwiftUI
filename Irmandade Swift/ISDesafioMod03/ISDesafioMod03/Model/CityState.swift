//
//  CityState.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import Foundation

struct CityState: Identifiable {
    let id = UUID()
    let name: String
    let abbreviation: String
    let cities: [City]

    static let mock: [CityState] = [.init(name: "Brasólia",
                                          abbreviation: "BSB",
                                          cities: City.mock),
                                    .init(name: "Nãoseilândia",
                                          abbreviation: "NSL",
                                          cities: City.mock)]
}
