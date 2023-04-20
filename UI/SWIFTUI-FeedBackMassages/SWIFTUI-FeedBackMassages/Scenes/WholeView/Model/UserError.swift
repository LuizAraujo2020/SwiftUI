//
//  UserError.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

enum UserError: Error {
    case failedLoading
    
    var description: String {
        switch self {
        case .failedLoading:
            return "🥹\n \n Sorry, we couldn't retrieve users. \n \n Come back in few minutes.\n \n "
        }
    }
}
