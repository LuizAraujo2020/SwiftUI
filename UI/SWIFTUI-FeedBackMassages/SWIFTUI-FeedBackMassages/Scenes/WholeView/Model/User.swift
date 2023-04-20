//
//  User.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation

// MARK: - UserElement
struct UserElement: Codable, Equatable, Hashable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company

    enum CodingKeys: String, CodingKey {
        case id       = "id"
        case name     = "name"
        case username = "username"
        case email    = "email"
        case address  = "address"
        case phone    = "phone"
        case website  = "website"
        case company  = "company"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(username)
        hasher.combine(email)
        hasher.combine(phone)
        hasher.combine(website)
    }
}

// MARK: - Address
struct Address: Codable, Equatable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo

    enum CodingKeys: String, CodingKey {
        case street  = "street"
        case suite   = "suite"
        case city    = "city"
        case zipcode = "zipcode"
        case geo     = "geo"
    }
}

// MARK: - Geo
struct Geo: Codable, Equatable {
    let lat: String
    let lng: String

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
}

// MARK: - Company
struct Company: Codable, Equatable {
    let name: String
    let catchPhrase: String
    let bs: String

    enum CodingKeys: String, CodingKey {
        case name        = "name"
        case catchPhrase = "catchPhrase"
        case bs          = "bs"
    }
}

typealias Users = [UserElement]
@propertyWrapper public struct NilOnFail<T: Codable>: Codable {
    
    public let wrappedValue: T?
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
