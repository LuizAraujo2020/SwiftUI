//
//  FooterView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct FooterView: View {
    let text: LocalizedStringKey
    
    var body: some View {
        ReusableText(type: .secondaryTitle, text: text, color: .secondaryText)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(text: "December/2018")
    }
}
