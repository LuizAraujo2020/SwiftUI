//
//  Todo.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

// MARK: - Todo
struct Todo: Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userId    = "userId"
        case id        = "id"
        case title     = "title"
        case completed = "completed"
    }
}

typealias Todos = [Todo]
