//
//  GameView.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import SwiftUI
import SceneKit

struct GameView: View {
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        ZStack {
            SceneView(scene: vm.scene)
        }
        .ignoresSafeArea()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(vm: GameViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
