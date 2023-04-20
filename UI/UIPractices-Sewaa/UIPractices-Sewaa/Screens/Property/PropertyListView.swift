//
//  PropertyListView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct PropertyListView: View {
    var body: some View {
        VStack {
            HStack {
                menu
                
                Spacer()
                
                viewMore
            }
            .background(.clear)
            .padding()
            
            ScrollView {
                ForEach(0..<10) { i in
                    PropertyRowCardView(title: "The Latitude Condo", rentalDate: .now, address: "Block 12, Level 6, Unit 9", pastDue: Date.now, isVacant: true)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .shadow(radius: .shadowRadius)
                }
                .padding(.top)
            }
        }
        .background(Color.backgroundPrimary)
        .padding()
    }
    
    var menu: some View {
        
        Menu {
            Button {
                
            } label: {
                Text("VACANT")
            }

        } label: {
            Text("Most Popular")
                .foregroundColor(.accentColor)
                .font(.title2.bold())
                
        }
    }
    
    var viewMore: some View {
        Button {
            
        } label: {
            Text("View More >")
                .foregroundColor(.accentColor)
                .font(.title3.bold())
                .opacity(0.8)
        }
    }
}

struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundSecondary.ignoresSafeArea()
            
            PropertyListView()
        }
    }
}
