//
//  ButtonSimpleView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct ButtonSimpleView: View {
    let text: LocalizedStringKey
    
    var body: some View {
        ZStack(alignment: .center) {
            Capsule(style: .continuous)
                .foregroundColor(.accentColor)
            
                ComponentTextView(type: .buttonLabel, text: text, color: .textSecondary)
            
        }
    }
}

struct ButtonSimpleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSimpleView(text: "Continue")
    }
}
