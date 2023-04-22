//
//  CircleButtonView.swift
//  Criptic
//
//  Created by Luiz Araujo on 20/04/23.
//

import SwiftUI

struct CircleButtonView: View {
    let symbol: String
    
    var body: some View {
        Image(systemName: symbol)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.theme.background)
            )
            .shadow(
                color: .theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(symbol: "heart.fill")
                .previewLayout(.sizeThatFits)
        }
    }
}
