//
//  Region.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import Foundation

struct Region: Identifiable {
    let id = UUID()
    let name: String
    let abbreviation: String
    let states: [CityState]

    static let mock: [Region] = [.init(name: "Centro-Oeste",
                                       abbreviation: "CO",
                                       states: CityState.mock),
                                 .init(name: "Sudeste",
                                       abbreviation: "SE",
                                       states: CityState.mock),
                                 .init(name: "Nordeste",
                                       abbreviation: "NE",
                                       states: CityState.mock),
                                 .init(name: "Terra Média",
                                       abbreviation: "TM",
                                       states: CityState.mock)]
}
