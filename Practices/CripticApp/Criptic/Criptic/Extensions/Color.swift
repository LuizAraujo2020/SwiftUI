//
//  Color.swift
//  Criptic
//
//  Created by Luiz Araujo on 20/04/23.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent        = Color("AccentColor")
    let background    = Color("BackgroundColor")
    let green         = Color("GreenColor")
    let red           = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
