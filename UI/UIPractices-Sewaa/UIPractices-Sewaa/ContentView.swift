//
//  ContentView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button {
                
            } label: {
                Text("ASD")
            }
            .frame(width: 300, height: 44)
            .background(.red)
            .clipShape(Capsule())

            
            BtnTest()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
