//
//  PropertyImageCardView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct PropertyImageCardView: View {
    var body: some View {
        ZStack {
            image
            
            VStack {
                HStack {
                    InsuredFlagView(isInsured: true)
                    
                    Spacer()
                    
                    DateRoundedView(date: .now, color: .white)
                        .padding(.trailing, .spacing2)
                }
                .padding(.top, .spacing3)
                
                Spacer()
                
                VacantCardView(title: "The Latitude Condo", rentalDate: .now, address: "Block 12, Level 6, Unit 9")
                    .padding(.bottom, .spacing2)
                
            }
        }
        .frame(width: .screenWidth * 0.877404, height: .screenWidth * 0.877404)
        .shadow(radius: .shadowRadius1)
    }
    
    var image: some View {
        Image("house")
            .resizable()
            .scaledToFit()
            .cornerRadius(.cornerRadius1, corners: [.allCorners])
            .shadow(radius: .shadowRadius1)
    }
    
    
}

struct PropertyImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyImageCardView()
    }
}
