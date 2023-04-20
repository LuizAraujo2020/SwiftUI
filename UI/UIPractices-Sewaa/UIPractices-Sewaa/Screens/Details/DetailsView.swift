//
//  DetailsView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct DetailsView: View {
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
                ScrollView {
                    DetailsImageCardView()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    TenantDetailsView(name: "Nathaniel Rick",
                                      duration: 10,
                                      rent: 100.00,
                                      paidDate: .now)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    MainButtonCustomView(isBig: true, isRed: true, label: buttonLabel as! AnyView, action: {})
                        .padding()
                    
                    PropertyListView()
                }
            }
        }
        .background(Color.backgroundSecondary)
    }
    
    var header: some View {
        HStack {
            
            NavBarButtonView(type: .back, action: {})
                .font(.largeTitle)
            
            Spacer()
            
            Text("Details")
                .font(.largeTitle.bold())
                .foregroundColor(.textTertiary)
            
            Spacer()
            
            NavBarButtonView(type: .plus, action: {})
                .font(.largeTitle)
        }
    }
    
    var buttonLabel: some View {
        HStack {
            Text("View Agreement")
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .foregroundColor(.textTertiary)
        }
        .padding(25)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
