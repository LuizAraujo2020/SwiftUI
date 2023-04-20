//
//  HeaderMainView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct HeaderMainView: View {
    let condition: LocalizedStringKey
    let dateLocal: LocalizedStringKey
    
    var body: some View {
        VStack(alignment: .center) {
            ReusableText(type: .secondaryTitle, text: condition, color: .secondaryText)
            ReusableText(type: .body, text: dateLocal, color: .secondaryText)
        }
    }
}

struct HeaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMainView(condition: "Raining", dateLocal: "04:24 PM - Bangalore")
            .previewLayout(.sizeThatFits)
    }
}



