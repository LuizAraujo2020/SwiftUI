//
//  Post.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let post = try? JSONDecoder().decode(Post.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - PostElement
struct PostElement: Codable, Hashable  {
    let userId: Int
    let id: Int
    let title: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id     = "id"
        case title  = "title"
        case body   = "body"
    }
}

typealias Posts = [PostElement]
