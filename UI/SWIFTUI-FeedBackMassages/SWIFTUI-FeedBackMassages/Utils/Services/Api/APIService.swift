//
//  APIService.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation


final class APIService {
    
    static let shared = APIService()
    
    init () { }
    
    
    func loadData<T: Codable>(url: String, completion:@escaping (T) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let decoded = try! JSONDecoder().decode(T.self, from: data!)
            print(decoded)
            DispatchQueue.main.async {
                completion(decoded)
            }
        }.resume()
        
    }
    
    func sendRequest<T: Decodable>(url: String, responseModel: T.Type) async -> Result<T, RequestError> {
        
        guard let url = URL(string: url) else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}


/// Resource
/// https://shresthanabin.medium.com/using-generics-to-handle-get-and-post-requests-swift-3cd8a9285293
