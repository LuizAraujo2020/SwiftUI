//
//  FlagBackground.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI
//import CoreGraphics

struct FlagBackground: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                
                path.addLine(to: CGPoint(x: geometry.size.width * 0.9, y: geometry.size.height * 0.5))
                
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))

            }
            .fill(color)
        }
    }
}

struct FlagBackground_Previews: PreviewProvider {
    static var previews: some View {
        FlagBackground(color: .red)
    }
}
