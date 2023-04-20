//
//  Movie.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

///Movie conforms to Decodable
///All properties are optionals to avoid crashes if there is no key in the JSON file matching them.
struct Movie: Decodable {
    
    let title: String?
    let poster_path: String?
    let overview: String?
    let releaseDate: String?
    let backdrop_path: String?
    let release_date: String?
}
