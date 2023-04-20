//
//  CrownFillCircleView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct CrownFillCircleView: View {
    let symbol: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Image(systemName: symbol)
                .symbolVariant(.fill)
                .foregroundColor(.accentColor)
                .background(
                    Circle()
                        .foregroundColor(.backgroundSecondary)
                        .scaleEffect(1.5)
                )
        }
    }
}

struct CrownFIllCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CrownFillCircleView(symbol: "crown")
            .scaleEffect(5)
    }
}
