//
//  EntryView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            VStack {
                Text("SEWAA")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 200)
                
                Spacer()
                
                MainButtonView(isBig: true, isRed: false, title: "Register", action: { })
                    .padding()
                
                MainButtonView(isBig: true, isRed: false, title: "Login", action: { })
                    .padding()
                
                Spacer()
                
                Text("Sewaa Apps v1.0")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
