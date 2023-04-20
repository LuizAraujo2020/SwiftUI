//
//  MovieFeed.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

enum MovieFeed {
    case nowPlaying
    case topRated
}

/// Conforms to Endpoint so it will be required to provide two pieces of information,
/// the base path and the path associated with the corresponding case,
/// this way we will construct the endpoint for each type of feed.
extension MovieFeed: Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .nowPlaying: return "/3/movie/now_playing"
        case .topRated: return "/3/movie/top_rated"
        }
    }
}

