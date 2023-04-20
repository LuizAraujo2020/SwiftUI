//
//  MessageProtocol.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 14/01/23.
//

import SwiftUI

//protocol MessageProtocol: Identifiable {
//    var imageName: String { get }
//    var systemImage: String { get }
//    var text: LocalizedStringKey { get }
//    var title: LocalizedStringKey { get }
//
//    var dummy: any MessageProtocol { get }
//}

struct Message {//: MessageProtocol {
    
    let id = UUID()
//    let systemImage: String
    let text: LocalizedStringKey
    let title: LocalizedStringKey
    
    let type: TypeOfMessage
    
    internal init(//systemImage: String = "",
                  title: LocalizedStringKey = "",
                  text: LocalizedStringKey = "",
                  type: TypeOfMessage = .alert) {
//        self.systemImage = systemImage
        self.text  = text
        self.title = title
        self.type  = type
    }
    
    internal init(error: ErrorType, title: LocalizedStringKey = "") {
        self.text  = LocalizedStringKey(error.description)
        self.title = title
        self.type  = .alert
    }
}

extension Message {
    enum TypeOfMessage {
        case alert
        case confirm
        case danger
        case info
        
        var symbol: String {
            switch self {
            case .alert: return "exclamationmark.triangle.fill"
            case .confirm: return "questionmark.diamond.fill"
            case .danger: return "xmark.diamond.fill"
            case .info: return "info.bubble.fill"
            }
        }
    }
}

extension Message {
    
    static var empty = Message(
                               title: "",
                               text: "", type: .info)
    
    static var dummy = Message(
                               title: "404 - Not found",
                               text: "The server was unable to process the request due to invalid information sent by the client.")
}







































