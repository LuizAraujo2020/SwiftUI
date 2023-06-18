//
//  ContentView.swift
//  SKTappyBirdy
//
//  Created by Luiz Araujo on 17/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        VStack {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.cyan, .blue],
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
                
                VStack {
                    Spacer()
                    
                    Text("Tappy Birdy")
                        .font(.system(.largeTitle))
                    
                    Spacer()
                    
                    NavigationLink {
                        GameView()
                        
                    } label: {
                        Text("Start Game")
                            .foregroundColor(.white)
                            .font(.system(.title))
                    }
                    .padding(.bottom)
                }
            }
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        //        }
        //        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
