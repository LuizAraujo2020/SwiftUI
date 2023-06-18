//
//  ContentView.swift
//  SCNBasic
//
//  Created by Luiz Araujo on 17/06/23.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    
    private let game = GameScene()
    
    var body: some View {
        SceneView(scene: game.scene//, options: [.allowsCameraControl]
        )
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
