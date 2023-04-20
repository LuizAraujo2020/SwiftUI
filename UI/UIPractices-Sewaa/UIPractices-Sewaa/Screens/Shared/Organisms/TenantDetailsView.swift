//
//  TenantDetailsView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct TenantDetailsView: View {
    let name: String
    let duration: Int
    let rent: Double
    let paidDate: Date
    
    var body: some View {
        HStack {
            image
            
            VStack(alignment: .leading) {
                lines(symbol: "person",
                      title: "Tanent Name :",
                      text: name)
                
                lines(symbol: "clock",
                      title: "Duration :",
                      text: "\(duration) \(duration > 1 ? "months" : "month")")
                
                lines(symbol: "creditcard",
                      title: "Rent :",
                      text: "$\(rent)/month")
                
                lines(symbol: "doc.text",
                      title: "Rent paid on :",
                      text: String(Date.now.formatted()) )
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
            TenantDetailsView(name: "Nathaniel Rick",
                              duration: 10,
                              rent: 100.00,
                              paidDate: .now)
        }
    }
}
