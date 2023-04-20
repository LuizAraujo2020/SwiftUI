//
//  WholeMessageViewModel.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation

final class WholeMessageViewModel: ObservableObject {
    
    @Published var listUsers = Users()
    @Published var userError: UserError?
    
    private let url = "https://jsonplaceholder.typicode.com/users"
    
    @MainActor
    func loadUsers(withError: Bool) {
        if withError {
            userError = UserError.failedLoading
            
        } else {
            
            APIService.shared.loadData(url: url) { (users) in
                self.listUsers = users
            }
            
            userError = nil
        }
    }
}
