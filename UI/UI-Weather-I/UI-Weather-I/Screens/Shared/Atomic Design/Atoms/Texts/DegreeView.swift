//
//  DegreeView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct DegreeView: View {
    let degree: Double
    
    var body: some View {
        ZStack {
//            Circle()
////                .foregroundColor(.white)
//                .strokeBorder(.mainRainning, lineWidth: 50)
            Circle()
                .frame(width: .screenWidth * 0.18)
                .foregroundColor(.white)
            Circle()
                .stroke(Color.mainRainning, lineWidth: CGFloat.borderWidth)
                .frame(width: .screenWidth * 0.18)
                .padding()
                .foregroundColor(.white)
            //
            //            ReusableText(type: .buttonLabel, text: "\(degree)º")
            //        }
            
            ReusableText(type: .body, text: "\(degree, specifier: "%.1f")º")
                .foregroundColor(.mainRainning)
        }
    }
}

struct DegreeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            DegreeView(degree: 999.9)
        }
    }
}
