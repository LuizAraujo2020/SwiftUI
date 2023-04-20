//
//  FeedbackMessage.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

protocol MessageCardfiable: Equatable, Hashable {
    var type: TypeOfMessage { get }
    var message: String { get }
}

struct FeedbackMessage: MessageCardfiable {
    
    let type: TypeOfMessage
    let message: String
    
    init(type: TypeOfMessage, message: String) {
        self.type    = type
        self.message = message
    }
    
    init(error: Error) {
        self.type    = .error
        self.message = error.localizedDescription
    }
    
    // MARK: Conformations
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(message)
    }
    
    static func == (lhs: FeedbackMessage, rhs: FeedbackMessage) -> Bool {
        return lhs.type == rhs.type && rhs.message == rhs.message
    }
}

enum TypeOfMessage: CaseIterable {
    
    case successful
    case error
    case info
    
    var symbol: String {
        
        switch self {
        case .successful: return "sparkles"
        case .error: return "xmark.diamond.fill"
        case .info: return "info.circle"
        }
    }
    
    var title: String {
        
        switch self {
        case .successful: return "Successful"
        case .error: return "Error"
        case .info: return "Info"
        }
    }
}
