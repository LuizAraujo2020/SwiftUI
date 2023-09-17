//
//  NPS.swift
//  EstatisticaDescritiva
//
//  Created by Luiz Araujo on 22/08/23.
//

import Foundation

struct Datum: Codable, Identifiable, Equatable {
    let id: Int
    let hour: String
    let dB: Double
}

func parseJSONFromFile() -> [Datum] {
    guard let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") else {
        print("File not found.")
        return []
    }

    do {
        let jsonData = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let data = try decoder.decode([Datum].self, from: jsonData)
        return data
    } catch {
        print("Error parsing JSON: \(error)")
        return []
    }
}
