//
//  CGFloat+Extension.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import UIKit

extension CGFloat {
    static let screenHeight  = UIScreen.main.bounds.size.height
    static let screenWidth   = UIScreen.main.bounds.size.width
    static let btnWidthBig   = CGFloat(screenWidth * 0.865385)
    static let btnWidthSmall = CGFloat(screenWidth * 0.396635)
    static let btnHeight     = CGFloat(screenWidth * 0.132212)
    
    static let spacing  = CGFloat(screenWidth * 0.002404)
    static let spacing0 = CGFloat(screenWidth * 0.01404)
    static let spacing1 = CGFloat(screenWidth * 0.050481)
    static let spacing2 = CGFloat(screenWidth * 0.081731)
    static let spacing3 = CGFloat(screenWidth * 0.132212)
    
    static let cornerRadius  = CGFloat(screenWidth * 0.031250)
    static let cornerRadius1 = CGFloat(screenWidth * 0.050481)
    static let cornerRadius2 = CGFloat(screenWidth * 0.081731)
    static let cornerRadius3 = CGFloat(screenWidth * 0.1)
    static let cornerRadius4 = CGFloat(screenWidth * 0.15)
    
    static let shadowRadius  = CGFloat(screenWidth * 0.0225)
    static let shadowRadius1 = CGFloat(screenWidth * 0.055)
    
    // MARK: Text Sizes
    static let textMain = CGFloat(screenWidth * 0.274475)
    
    
    // MARK: Images Sizes
    static let imageWidth = CGFloat(screenWidth * 0.415282)
    
    // MARK:
    static let borderWidth = CGFloat(screenWidth * 0.02)
}

