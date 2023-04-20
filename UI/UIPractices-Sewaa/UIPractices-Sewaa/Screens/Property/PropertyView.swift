//
//  PropertyView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct PropertyView: View {
    var body: some View {
        ZStack {
            
            VStack {
                Color.accentColor
                    .frame(height: .screenWidth * 0.5)
                    .cornerRadius(.cornerRadius2, corners: [.bottomRight, .bottomLeft])
                    .ignoresSafeArea(edges: .top)
                
                Spacer()
            }
            
            VStack {
                header
                    .padding(.horizontal)
                
                PropertyImageCardView()
                
                Divider()
                    .padding(.horizontal)
                
                PropertyListView()
            }
        }
        .background(Color.backgroundSecondary)
    }
    
    var header: some View {
        HStack {
            Spacer()
            
            Text("Property")
                .font(.largeTitle.bold())
                .foregroundColor(.textTertiary)
            
            Spacer()
            
            NavBarButtonView(type: .plus, action: {})
                .font(.largeTitle)
        }
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView()
    }
}
