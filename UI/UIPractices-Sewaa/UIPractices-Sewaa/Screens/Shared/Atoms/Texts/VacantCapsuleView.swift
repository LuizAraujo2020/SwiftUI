//
//  VacantCapsuleView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct VacantCapsuleView: View {
    let isVacant: Bool
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(isVacant ? .accentColor : .textPrimary)
                .frame(width: .screenWidth * 0.192308, height: .screenWidth * 0.048077)
                .opacity(0.5)
            
            Text(isVacant ? "VACANT" : "RENTED")
                .font(.subheadline)
                .bold()
                .foregroundColor(.textTertiary)
        }
    }
}

struct VacantCapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VacantCapsuleView(isVacant: true)
            VacantCapsuleView(isVacant: false)
        }
    }
}
