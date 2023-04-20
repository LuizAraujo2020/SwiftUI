//
//  BackgroundView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Triangle()
                .fill(Color.tertiaryText)
                .frame(width: .screenWidth * 1.5,
                       height: .screenWidth * 1.5)
                .rotationEffect(Angle(degrees: 180))
            
            Triangle()
                .fill(Color.quinaryText)
                .frame(width: .screenWidth * 1,
                       height: .screenWidth * 1)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: .screenWidth * -0.25)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
