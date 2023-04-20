//
//  ProfileView.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.backgroundSecondary.ignoresSafeArea()
            
            VStack {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.accentSecondary)
                    .font(.system(size: .imageWidth))
                    .symbolVariant(.circle)
                
                ComponentTextView(type: .largeTitle, text: "Lillie Brown", color: .textPrimary)
                
                BadgeView(symbol: "trophy.fill", text: "Embassador")
                    .frame(width: .screenWidth * 0.4, height: .screenWidth * 0.1)
                
                cards
                
                ZStack {
                    Color.white
                        .cornerRadius(.cornerRadius2)
                        .ignoresSafeArea(edges: [.bottom])
                    
                    VStack {
                        groupLinks
                        
                        MainButtonView(symbol: "crown", text: "Become a pro member")
                    }
                }
            }
        }
    }
    
    var cards: some View {
        HStack {
            CardView(number: 112, text: "Following")
            CardView(number: 627, text: "Likes")
                .padding()
            CardView(number: 8, text: "Collections")
        }
    }
    
    var groupLinks: some View {
        List {
            NavigationLink(destination: Text("Notifications")) {
                ListRowView(symbol: "bell.fill",
                            text: "Notifications")
                .padding(.vertical, .spacing0)
            }
            
            NavigationLink(destination: Text("Become an artist on Flamingo")) {
                ListRowView(symbol: "paintpalette.fill",
                            text: "Become an artist on Flamingo")
                .padding(.vertical, .spacing0)
            }
            
            NavigationLink(destination: Text("My downloads")) {
                ListRowView(symbol: "folder.fill",
                            text: "My downloads")
                .padding(.vertical, .spacing0)
            }
            
            NavigationLink(destination: Text("Payment settings")) {
                ListRowView(symbol: "creditcard.fill",
                            text: "Payment settings")
                .padding(.vertical, .spacing0)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
