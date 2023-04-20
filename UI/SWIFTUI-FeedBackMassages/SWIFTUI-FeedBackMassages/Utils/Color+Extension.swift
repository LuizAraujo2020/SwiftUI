//
//  Color+Extension.swift
//  TravelApp
//
//  Created by Thiago de Oliveira Sousa on 26/09/22.
//

import SwiftUI

extension Color {
    static let colorExample = "ColorName"
    
    // Gray Scale
    static var backgroundDark:    Color { Color("background-dark") }
    static var backgroundLight:   Color { Color("background-light") }
    static var backgroundRegular: Color { Color("background-regular") }
    
    // Primary brand Colors
    static let primaryPure   = Color(red: 255/255, green: 159/255, blue: 10/255)
    static let primaryLight  = Color(red: 255/255, green: 235/255, blue: 204/255)
    static let primaryMedium = Color(red: 253/255, green: 179/255, blue: 67/255)
    static let primaryDark   = Color(red: 227/255, green: 144/255, blue: 0/255)
    
    // Secondary brand Colors
    static let secondaryPure   = Color(red: 89/255, green: 58/255, blue: 166/255)
    static let secondaryLight  = Color(red: 139/255, green: 106/255, blue: 221/255)
    static let secondaryMedium = Color(red: 91/255, green: 49/255, blue: 196/255)
    static let secondaryDark   = Color(red: 57/255, green: 38/255, blue: 105/255)
    
    // High neutral Colors
    static let highPure   = Color(red: 255/255, green: 255/255, blue: 255/255)
    static let highLight  = Color(red: 245/255, green: 245/255, blue: 245/255)
    static let highMedium = Color(red: 224/255, green: 224/255, blue: 224/255)
    static let highDark   = Color(red: 204/255, green: 204/255, blue: 204/255)
    
    // Low neutral Colors
    static let lowPure   = Color(red: 0/255, green: 0/255, blue: 0/255)
    static let lowLight  = Color(red: 162/255, green: 162/255, blue: 162/255)
    static let lowMedium = Color(red: 102/255, green: 102/255, blue: 102/255)
    static let lowDark   = Color(red: 41/255, green: 41/255, blue: 41/255)
    
    // Dark mode Colors
    static let darkModePure   = Color(red: 23/255, green: 29/255, blue: 51/255)
    static let darkModeLight  = Color(red: 35/255, green: 45/255, blue: 83/255)
    static let darkModeMedium = Color(red: 24/255, green: 31/255, blue: 57/255)
    static let darkModeDark   = Color(red: 13/255, green: 19/255, blue: 41/255)
    
    // Highlight Colors
    static let highlightPure   = Color(red: 246/255, green: 115/255, blue: 173/255)
    static let highlightLight  = Color(red: 253/255, green: 217/255, blue: 233/255)
    static let highlightMedium = Color(red: 144/255, green: 9/255, blue: 69/255)
    static let highlightDark   = Color(red: 67/255, green: 4/255, blue: 32/255)
    
    // Feedback error Colors
    static let errorPure   = Color(red: 231/255, green: 22/255, blue: 22/255)
    static let errorLight  = Color(red: 255/255, green: 27/255, blue: 27/255)
    static let errorMedium = Color(red: 205/255, green: 20/255, blue: 20/255)
    static let errorDark   = Color(red: 150/255, green: 22/255, blue: 22/255)
    
    // Feedback success Colors
    static let successPure   = Color(red: 64/255, green: 163/255, blue: 4/255)
    static let successLight  = Color(red: 112/255, green: 223/255, blue: 45/255)
    static let successMedium = Color(red: 96/255, green: 166/255, blue: 54/255)
    static let successDark = Color(red: 40/255, green: 103/255, blue: 1/255)
    
    
    // LoadView
    static let textLightGray: Color = Color(red: 210/255, green: 210/255, blue: 210/255)
}

