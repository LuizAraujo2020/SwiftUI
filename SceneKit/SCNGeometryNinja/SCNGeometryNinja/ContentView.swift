//
//  ContentView.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameViewModel = GameViewModel()
    
    @State private var showLaunchScreen = false
    
    var body: some View {
        ZStack {
            GameView(vm: gameViewModel)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            
            if showLaunchScreen {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(.blue)
                    
                    Image("Logo_Diffuse")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

                        showLaunchScreen = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
