//
//  CongratsView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct CongratsView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .cornerRadius4)
                .foregroundColor(.white)
            
            VStack {
                Image(systemName: "star.fill")
                    .font(.system(size: .screenWidth * 0.4))
                    .foregroundColor(.accentColor)
                    .shadow(radius: .shadowRadius1)
                
                ComponentTextView(type: .largeTitle, text: "Congrats, Lillie !")
                    .padding()
                
                ComponentTextView(type: .body, text: "You just unlocked a new badge")
                    .padding()
                
                ComponentTextView(type: .body, text: "Thanks for being such an active member in our community", alignment: .center)
                    .padding()
                
                ButtonSimpleView(text: "Continue")
                    .frame(width: .screenWidth * 0.5, height: .screenWidth * 0.166113)
            }
        }
        .frame(width: .screenWidth * 0.8, height: .screenWidth * 1.4)
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            CongratsView()
        }
    }
}
