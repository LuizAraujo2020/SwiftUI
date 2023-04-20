//
//  InsuredFlagView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct InsuredFlagView: View {
    let isInsured: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            FlagBackground(color: isInsured ?  .flagBackgroundPrimary : .flagBackgroundSecondary)
            
            Text(isInsured ? "INSURED" : "UNINSURED")
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding(.leading)
        }
        .frame(width: .screenWidth * 0.372596, height: .screenWidth * 0.120192)
    }
}

struct InsuredFlagView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InsuredFlagView(isInsured: true)
            InsuredFlagView(isInsured: false)
        }
    }
}
