//
//  VacantCardView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct VacantCardView: View {
    let title: String
    let rentalDate: Date
    let address: String
    
    var body: some View {
        //        GeometryReader { geo in
        //            let width = geo.size.width
        //            let height = geo.size.height
        
        ZStack {
            
            
            ZStack {
                Rectangle()
                    .foregroundColor(.backgroundPrimary)
                    .frame(width: .screenWidth * 0.793269, height: .screenWidth * 0.216346)
                    .cornerRadius(.cornerRadius, corners: [.allCorners])
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .bold()
                        Text("Rental Date: " + rentalDate.formatted(.dateTime.day().month().year()))
                            .font(.caption)
                        Text(address)
                            .font(.caption)
                    }
                    .padding()
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.accentColor)
                            .frame(width: .screenWidth * 0.216346)
                            .cornerRadius(.cornerRadius, corners: [.topRight, .bottomRight])
                        
                        VStack {
                            Text("VIEW")
                            Text("MORE")
                        }
                        .fontWeight(.black)
                        .foregroundColor(.textTertiary)
                    }
                }
            }
            .background(alignment: .topLeading) {
                TextVacantRoundedView()
                    .frame(width: .screenWidth * 0.25, height: .screenWidth * 0.1)
                    .offset(y: 0 - .screenWidth * 0.0675)
            }
        }
        .frame(width: .screenWidth * 0.793269, height: .screenWidth * 0.216346)
    }
    //    }
}

struct VacantCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                VacantCardView(title: "The Latitude Condo", rentalDate: .now, address: "Block 12, Level 6, Unit 9")
                
                Spacer()
            }
        }
    }
}
