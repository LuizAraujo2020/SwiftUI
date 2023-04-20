//
//  APIClient.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

/// A generic APICLient that you can reuse in any project and with any type of object or collection of them.
/// Every object that conforms to APIClient will have a session and will be able to use the generic fetch function.
protocol APIClient {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest,
                             decode: @escaping (Decodable) -> T?,
                             completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    func fetch<T: Decodable>(with request: URLRequest,
                             decode: @escaping (Decodable) -> T?,
                             completion: @escaping (Result<T, APIError>) -> Void) {
        
        /// A a task from the helper below, passing as a parameter for decodingType the type that this function will decode `T`.
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            
            //MARK: change to main queue
            DispatchQueue.main.async {
                /// Check if the JSON its not nil and if has been decoded,
                /// then pass the decoded data in the success case of the completion handler.
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
    
    /// This function will be the one in charge of parsing or rather decoding the JSON data.
    /// - Parameters:
    ///   - decodingType: The type of an object that conforms to Decodable;
    /// - Returns: it returns an URLSessionDataTask.
    private func decodingTask<T: Decodable>(with request: URLRequest,
                                            decodingType: T.Type,
                                            completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            /// Check the response and statusCode and based on that we Decode the data from the response or in case of an error provide the corresponding error information.
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                
                if let data = data {
                    
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                    
                } else {
                    completion(nil, .invalidData)
                }
                
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        /// Returns the Task, so we don’t call resume.
        return task
    }
}
