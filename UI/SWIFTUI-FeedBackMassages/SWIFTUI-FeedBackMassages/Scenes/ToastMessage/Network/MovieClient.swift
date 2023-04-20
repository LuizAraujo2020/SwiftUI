//
//  MovieClient.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

class MovieClient: APIClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    /// This has a convenient init because for this purposes we want always to set the URLSession to default.
    convenience init() {
        self.init(configuration: .default)
    }
    
    /// In the signature of the function in the success case we define the Class type thats is the generic one in the API
    func getFeed(from movieFeedType: MovieFeed,
                 completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        
        /// Convert the generic type to MovieFeedResult? type so when the decode completion
        /// handler is executed the json it’s now a Decodable model, then,
        /// we downcast it safely to a MovieFeedResult and return it.
        fetch(with: movieFeedType.request , decode: { json -> MovieFeedResult? in
            
            guard let movieFeedResult = json as? MovieFeedResult else { return  nil }
            return movieFeedResult
            
        }, completion: completion)
    }
}
