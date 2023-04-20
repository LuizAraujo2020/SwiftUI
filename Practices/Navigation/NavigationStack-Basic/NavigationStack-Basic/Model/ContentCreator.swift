//
//  ContentCreator.swift
//  NavigationStack-Basic
//
//  Created by Luiz Araujo on 27/02/23.
//

import Foundation

struct ContentCreator: Identifiable, Hashable {
    let id = UUID()
    let name: String

    static let preview = [
        ContentCreator(name: "Luiz"),
        ContentCreator(name: "Carlos"),
        ContentCreator(name: "Abrilina"),
        ContentCreator(name: "Saracura"),
        ContentCreator(name: "Astronildo")
    ]
}
