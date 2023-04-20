//
//  PropertyRowCardView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct PropertyRowCardView: View {
    let title: String
    let rentalDate: Date
    let address: String
    let pastDue: Date
    
    let isVacant: Bool
    
    var body: some View {
//        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: .cornerRadius1)
                    .foregroundColor(.backgroundPrimary)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.textPrimary)
                    
                    Text("Rental Date: " + rentalDate.formatted(.dateTime.day().month().year()))
                        .font(.caption)
                    
                    Text(address)
                        .font(.caption)
                    
                    Text("Past Due: " + pastDue.formatted(.dateTime.day().month().year()))
                        .font(.caption)
                }
                .padding()
                .foregroundColor(.textSecondary)
            }
            .overlay(alignment: .bottomTrailing) {
                VacantCapsuleView(isVacant: isVacant)
                    .padding()
            }
//        }
    }
}

struct PropertyRowCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            PropertyRowCardView(title: "The Latitude Condo", rentalDate: .now, address: "Block 12, Level 6, Unit 9", pastDue: Date.now, isVacant: true)
        }
    }
}
