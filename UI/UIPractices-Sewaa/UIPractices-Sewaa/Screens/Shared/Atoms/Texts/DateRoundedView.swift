//
//  DateRoundedView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct DateRoundedView: View {
    let date: Date
    let color: Color
    
    var body: some View {
//            GeometryReader { geo in
                ZStack(alignment: .center) {
                Capsule()
                    .foregroundColor(.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: .screenWidth * 0.25)
                            .stroke(color, lineWidth: 2)
                    )
                    .frame(width: .screenWidth * 0.25, height: .screenWidth * 0.075)
                    
                
                HStack {
                    Image(systemName: "calendar")
                    Text(date.formatted(.dateTime.day().month().year()))
                }
                .font(.system(size: .screenWidth * 0.025))
                .foregroundColor(color)
            }
//        }
    }
}

struct DateRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            DateRoundedView(date: .now, color: .white)
                .frame(width: 300, height: 100)
        }
    }
}
