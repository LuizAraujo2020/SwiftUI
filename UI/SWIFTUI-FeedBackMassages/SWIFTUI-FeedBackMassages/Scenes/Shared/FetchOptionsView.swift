//
//  FetchOptionsView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct FetchOptionsView: View {
    let actionWithoutError: () -> Void
    let actionWithError: () -> Void
    
    var body: some View {
        VStack {
            Text("Fetch")
                .font(.title)
            
            Text("Usually the fetch would be on the `onAppear`, `.task`...")
                .foregroundColor(.gray)
                .font(.caption)
                .padding(.bottom)
            
            HStack {
                CompButtonRegular(title: "No error", color: .green) { actionWithoutError() }
                CompButtonRegular(title: "With error", color: .red) { actionWithError() }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.ultraThickMaterial)
                .shadow(radius: 12)
        )
    }
}

struct FetchOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        FetchOptionsView(actionWithoutError: { },
                         actionWithError: { })
    }
}
