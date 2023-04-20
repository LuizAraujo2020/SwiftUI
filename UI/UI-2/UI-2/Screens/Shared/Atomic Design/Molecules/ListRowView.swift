//
//  ListRowView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct ListRowView: View {
    let symbol: String
    let text: LocalizedStringKey
    
    var body: some View {
        HStack {
            Image(systemName: symbol)
                .symbolRenderingMode(.multicolor)
                .font(.system(.title))
            
            ComponentTextView(type: .body, text: text, color: .textPrimary)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            ListRowView(symbol: "bell.fill", text: "Notifications")
            
            ListRowView(symbol: "paintpalette.fill", text: "Become an artist on Flamingo")
            
            ListRowView(symbol: "folder.fill", text: "My downloads")
            
            ListRowView(symbol: "creditcard.fill", text: "Payment settings")
        }
    }
}
