//
//  HomeView.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "line.3.horizontal.decrease")

                Spacer()

                Text("Wallet")
                    .font(.headline)

                Spacer()

                Image(systemName: "person.crop.cirlce")
            }
            .padding()

            CardView()
                .frame(height: 200)
                .padding(.horizontal, 24)

            Text("Categories")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(24)

            HStack {
                VStack {
                    CardView(title: "Debit", x: 300, y: -300)
                        .frame(width: 160, height: 200)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
