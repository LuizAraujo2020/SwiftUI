//
//  ImageMessageStyle.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 14/01/23.
//

import SwiftUI

struct ImageMessageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .symbolRenderingMode(.multicolor)
            .font(.system(size: .screenWidth * 0.35))
            .padding(.screenWidth * 0.001)
            .shadow(radius: .shadowRadius)
    }
}

extension View {
    func imageMessageStyle() -> some View {
        modifier(ImageMessageStyle())
    }
}
