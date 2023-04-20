//
//  DetailsImageCardView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct DetailsImageCardView: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            image
            
            ZStack(alignment: .leading) {
                Color.backgroundPrimary
                
                VStack {
                    Text("Master Bedroom")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .bold()
                    
                    Text("Main big double bedroom with landscape")
                        .foregroundColor(.textSecondary)
                        .font(.caption)
                        .padding(.horizontal)
                }
            }
            .frame(width: .screenWidth * 0.432692, height: .screenWidth * 0.192308)
            .cornerRadius(.cornerRadius, corners: [.bottomLeft, .topLeft])
            .padding(.top, 100)
            
        }
        .frame(width: .screenWidth * 0.877404, height: .screenWidth * 0.877404)
        .shadow(radius: .shadowRadius)
    }
    
    var image: some View {
        Image("house")
            .resizable()
            .scaledToFit()
            .cornerRadius(.cornerRadius1, corners: [.allCorners])
            .shadow(radius: .shadowRadius1)
    }
}

struct DetailsImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsImageCardView()
    }
}
