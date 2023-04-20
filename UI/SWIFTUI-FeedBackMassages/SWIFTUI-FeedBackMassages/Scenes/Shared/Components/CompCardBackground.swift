//
//  CompCardBackground.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 10/02/23.
//

import SwiftUI

struct CompCardBackground: View {
    let rounded: Bool
    
    var body: some View {
        GeometryReader { geo in
            let smallest = geo.size.width <= geo.size.height ? geo.size.width : geo.size.height
            
            createBackground(size: smallest)
        }
    }
    
    @ViewBuilder
    private func createBackground(size: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: rounded ? size * 0.1 : 0.0)
            .foregroundStyle(Color.darkModeDark)
            .opacity(0.8)
    }
}

struct CompCardBackground_Previews: PreviewProvider {
    static var previews: some View {
//        CompCardBackground(rounded: true)
        CompCardBackground(rounded: false)
    }
}
