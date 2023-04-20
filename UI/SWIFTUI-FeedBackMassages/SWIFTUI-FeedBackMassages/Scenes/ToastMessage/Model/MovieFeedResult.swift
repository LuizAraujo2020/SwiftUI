//
//  MovieFeedResult.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

///the JSON has a key called results and its an array of movies.
struct MovieFeedResult: Decodable {
    let results: [Movie]?
}
