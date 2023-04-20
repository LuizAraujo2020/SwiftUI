//
//  BadgeView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct BadgeView: View {
    let symbol: String
    let text: LocalizedStringKey
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.white)
            
            HStack {
                Image(systemName: symbol)
                    .foregroundColor(.yellow)
                    .font(.system(.title))
                
                ComponentTextView(type: .body, text: text, color: .textPrimary)
            }
        }
    }
}

struct ProfileBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(symbol: "trophy.fill", text: "Embassador")
    }
}
