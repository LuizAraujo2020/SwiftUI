//
//  CardView.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct CardView: View {
    var title = "Cards"
    var x: CGFloat = 100
    var y: CGFloat = -100

    var body: some View {
        VStack {
            Text(title).font(.title).bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(
            Image("Background")
        )
        .cornerRadius(10)
        .mask(RoundedRectangle(cornerRadius: 30))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
