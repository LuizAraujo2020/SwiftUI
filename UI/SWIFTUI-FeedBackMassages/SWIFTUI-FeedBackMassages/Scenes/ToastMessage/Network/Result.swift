//
//  Result.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import Foundation

/// When we make an URL request we may get two different kinds of response,
/// either a successful one or one that failed. Usually, we will pass both in a completion
/// handler setting to nil one of them, however, with this Generic enum we can avoid that and
/// pass just what we need for each case.
enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
