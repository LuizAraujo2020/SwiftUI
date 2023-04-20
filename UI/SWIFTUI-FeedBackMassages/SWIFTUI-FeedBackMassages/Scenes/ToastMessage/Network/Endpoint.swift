//
//  Endpoint.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

/// Has two required properties called “base” and “path” just like a regular endpoint,
protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    /// The APIKey required to be able to make the request
    var apiKey: String {
//        return "api_key=34a92f7d77a168fdcd9a46ee1863edf1" /// From tutorial.
        return "api_key=88f58e4d77a087498278a028bf336722"
    }
    
    /// The Components property that will construct the url.
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    /// The request that returns an URLRequest.
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
