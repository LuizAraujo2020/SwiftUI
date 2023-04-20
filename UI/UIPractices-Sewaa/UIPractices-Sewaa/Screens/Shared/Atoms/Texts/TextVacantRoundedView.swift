//
//  TextVacantRoundedView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct TextVacantRoundedView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.accentColor)
                .cornerRadius(.cornerRadius, corners: [.topLeft, .topRight])
            
            Text("VACANT")
                .foregroundColor(.textTertiary)
                .bold()
                .padding()
                .offset(y: -7)
        }
    }
}

struct TextVacantRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        TextVacantRoundedView()
    }
}
