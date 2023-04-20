//
//  MainButtonView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct MainButtonView: View {
    let symbol: String
    let text: LocalizedStringKey
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule(style: .continuous)
                .foregroundColor(.accentColor)
            
            HStack {
                CrownFillCircleView(symbol: symbol)
                    .scaleEffect(2)
                    .padding(.leading, .spacing1)
                
                Spacer()
                
                ComponentTextView(type: .buttonLabel, text: text, color: .textSecondary)
                
                Spacer()
            }
        }
        .frame(width: .screenWidth * 0.730897, height: .screenWidth * 0.166113)
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView(symbol: "crown", text: "Become a pro member")
    }
}
