//
//  HeaderSecondaryView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

struct HeaderSecondaryView: View {
    let address: LocalizedStringKey
    let description: LocalizedStringKey
    
    var body: some View {
        HStack {
            VStack {
                ReusableText(type: .secondaryTitle,
                             text: address,
                             color: .secondaryText)
                ReusableText(type: .body,
                             text: description,
                             color: .secondaryText,
                             alignment: .center, lineLimit: 3)
            }
            .padding(.horizontal)
        }
    }
}

struct HeaderConditionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSecondaryView(address: "Brasília", description: "Similar temperatures continuing with a chance of rain multiple days.")
            .previewLayout(.sizeThatFits)
    }
}
