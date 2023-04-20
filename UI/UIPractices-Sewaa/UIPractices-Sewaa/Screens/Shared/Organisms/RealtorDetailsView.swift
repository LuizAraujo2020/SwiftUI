//
//  TanentDetailsView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct TanentDetailsView: View {
    var body: some View {
        HStack {
            image
            
            VStack(alignment: .leading) {
                lines(symbol: "person",
                      title: "Tanent Name :",
                      text: "Nathaniel Rick")
                
                lines(symbol: "clock",
                      title: "Duration :",
                      text: "Nathaniel Rick")
                
                lines(symbol: "creditcard",
                      title: "Rent :",
                      text: "Nathaniel Rick")
                
                lines(symbol: "doc.text",
                      title: "Rent paid on :",
                      text: "Nathaniel Rick")
            }
        }
    }
    
    var image: some View {
        Image(systemName: "person.circle.fill")
            .foregroundColor(.gray)
            .font(.system(size: 75))
    }
    
    @ViewBuilder
    func lines(symbol: String, title: String, text: String) -> some View {
        HStack {
            Image(systemName: symbol)
                .foregroundColor(.accentColor)
                .frame(width: 25)
            Text(title)
                .foregroundColor(.textSecondary)
            Text(text)
                .foregroundColor(.textPrimary)
        }
    }
}

struct RealtorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            TanentDetailsView()
        }
    }
}
