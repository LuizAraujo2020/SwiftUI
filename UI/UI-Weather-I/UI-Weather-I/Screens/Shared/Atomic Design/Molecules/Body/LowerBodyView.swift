//
//  LowerBodyView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct LowerBodyView: View {
    let dayOfWeek: LocalizedStringKey
    let day: LocalizedStringKey
    
    var body: some View {
        
        VStack {
            ReusableText(type: .body, text: "Today", color: .secondary)
            
//            HStack {
//                IndicatorView(isRight: false, action: { })
//
//                Spacer()
                
                VStack {
                    
                    ReusableText(type: .secondaryTitle, text: dayOfWeek, color: .secondaryText)
                    
                    ReusableText(type: .mainTitle, text: day)
                }
                
//                Spacer()
//
//                IndicatorView(isRight: true, action: { })
//
//            }
        }
    }
}

struct TemperatureWithDay_Previews: PreviewProvider {
    static var previews: some View {
        LowerBodyView(dayOfWeek: "Tuesday", day: "25")
    }
}
