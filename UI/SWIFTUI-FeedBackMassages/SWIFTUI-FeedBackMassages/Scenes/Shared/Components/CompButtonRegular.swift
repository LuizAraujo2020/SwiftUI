//
//  CompButtonRegular.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct CompButtonRegular: View {
    let title: String
    let color: Color
    let perform: () -> Void
    
    var body: some View {
        Button {
            perform()
            
        } label: {
            
            ZStack {
                Capsule(style: .continuous)
                    .foregroundColor(color)
                    .frame(width: 150, height: 50)
                
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
            .shadow(radius: 12)
        }
    }
}

struct CompButtonRegular_Previews: PreviewProvider {
    static var previews: some View {
        CompButtonRegular(title: "No error", color: .accentColor) { }
    }
}
