//
//  GameView.swift
//  SKTappyBirdy
//
//  Created by Luiz Araujo on 17/06/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    @StateObject private var game = GameScene()
    
    var body: some View {
        ZStack {
            HStack {
                SpriteView(scene: game)
                    .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GameView()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
