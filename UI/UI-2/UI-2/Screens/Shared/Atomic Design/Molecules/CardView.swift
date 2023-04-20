//
//  CardView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct CardView: View {
    let number: Int
    let text: LocalizedStringKey
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .cornerRadius1)
                .foregroundColor(.backgroundPrimary)
            
            VStack {
                ComponentTextView(type: .title, text: "\(number)", color: .textPrimary)
                
                ComponentTextView(type: .body, text: text, color: .textPrimary)
            }
        }
        .frame(width: .screenWidth * 0.232558,
               height: .screenWidth * 0.232558)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            CardView(number: 112, text: "Following")
        }
    }
}
