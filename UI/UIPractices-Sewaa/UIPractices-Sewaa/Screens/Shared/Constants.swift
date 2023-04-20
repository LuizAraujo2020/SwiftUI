//
//  Constants.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

extension Color {
    
    static let primary                 = Color("bg-primary")
    static let backgroundPrimary       = Color("bg-primary")
    static let backgroundSecondary     = Color("bg-secondary")
    static let flagBackgroundPrimary   = Color("flag-bg-primary")
    static let flagBackgroundSecondary = Color("flag-bg-secondary")
    static let textPrimary             = Color("text-primary")
    static let textSecondary           = Color("text-secondary")
    static let textTertiary            = Color("text-tertiary")
    static let textfieldBackground     = Color("textfield-bg")
}

extension CGFloat {
    static let screenWidth   = UIScreen.main.bounds.size.width
    static let btnWidthBig   = CGFloat(screenWidth * 0.865385)
    static let btnWidthSmall = CGFloat(screenWidth * 0.396635)
    static let btnHeight     = CGFloat(screenWidth * 0.132212)
    
    static let spacing  = CGFloat(screenWidth * 0.002404)
    static let spacing1 = CGFloat(screenWidth * 0.050481)
    static let spacing2 = CGFloat(screenWidth * 0.081731)
    static let spacing3 = CGFloat(screenWidth * 0.132212)
    
    static let cornerRadius = CGFloat(screenWidth * 0.031250)
    static let cornerRadius1 = CGFloat(screenWidth * 0.050481)
    static let cornerRadius2 = CGFloat(screenWidth * 0.081731)
    
    static let shadowRadius = CGFloat(screenWidth * 0.0225)
    static let shadowRadius1 = CGFloat(screenWidth * 0.055)
}

