//
//  Errors.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 15/01/23.
//

// MARK: - Errors
enum ErrorType: Error, Equatable {
    
    case invalidRequest
    case serverProblem
    case failedToDecode
    case fileNotFound
    case custom(error: Error)
    
    static func == (lhs: ErrorType, rhs: ErrorType) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
    
    var description: String {
        switch self {
        case .invalidRequest: return "The request is invalid."
        case .serverProblem: return "There is a problem with the server. Try again in few minutes."
        case .failedToDecode: return "Failed to retrieve the correct data."
        case .fileNotFound: return "File not found, the name or extension is incorrect."
        case .custom(error: let error): return error.localizedDescription
        }
    }
}
