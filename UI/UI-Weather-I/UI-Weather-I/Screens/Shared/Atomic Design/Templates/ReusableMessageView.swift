//
//  ReusableMessageView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 14/01/23.
//

import SwiftUI

struct ReusableMessageView: View {
    let message: Message
    let dismiss: () -> Void
    
    var body: some View {
        ZStack {
            backgroundMatte
            
            backgroundRounded
            
            VStack {
                symbol
                
                ReusableText(type: .secondaryTitle,
                             text: message.title)
                    .padding(.vertical, .screenWidth * 0.0001)
                
                ReusableText(type: .body,
                             text: message.text,
                             color: .secondaryText,
                             alignment: .center,
                             lineLimit: 3)
            }
            .padding(.horizontal, .spacing3)
        }
        .frame(width: .screenWidth * 0.85, height: .screenWidth)
        .onTapGesture {
            dismiss()
        }
    }
    
    var backgroundMatte: some View {
        
        Rectangle()
            .foregroundStyle(.ultraThinMaterial)
            .frame(width: .screenWidth, height: .screenHeight)
    }
    
    var backgroundRounded: some View {
        
        RoundedRectangle(cornerRadius: .cornerRadius1)
            .foregroundStyle(.ultraThickMaterial)
            .frame(width: .screenWidth * 0.85, height: .screenWidth)
            .shadow(radius: .shadowRadius1)
    }
    
    var symbol: some View {
        Image(systemName: message.type.symbol)
            .imageMessageStyle()
    }
}

struct ReusableMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableMessageView(message: Message.dummy) { }
    }
}





































