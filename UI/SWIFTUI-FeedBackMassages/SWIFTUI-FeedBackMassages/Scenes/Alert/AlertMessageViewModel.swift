//
//  AlertMessageModel.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation


final class AlertMessageViewModel: ObservableObject {
    
    @Published var listPosts = Posts()
    @Published var userError: RequestError?
    
    private let url = "https://jsonplaceholder.typicode.com/posts"
    
    @MainActor
    func loadComments(withError: Bool) async {
        
        if withError {
            userError = RequestError.invalidURL
            
        } else {
            Task(priority: .background) {
                let result = await APIService.shared.sendRequest(url: url, responseModel: Posts.self)
                switch result {
                case .success(let movieResponse):
                    listPosts = movieResponse
                    
                case .failure(let error):
                    userError = error
                }
            }
        }
    }
}
