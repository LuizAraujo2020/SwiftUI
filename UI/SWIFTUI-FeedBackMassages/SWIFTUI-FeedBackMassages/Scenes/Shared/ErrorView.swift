//
//  ErrorView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ErrorView: View {
    
    let errorTitle: String
    let perform: () -> Void
    
    var body: some View {
        ZStack {
            CompCardBackground(rounded: false)
            
            VStack {
                Text(errorTitle)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                CompButtonRegular(title: "Try again", color: .red) {
                    perform()
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorTitle: Constants.Texts.loremMicro) { }
    }
}
