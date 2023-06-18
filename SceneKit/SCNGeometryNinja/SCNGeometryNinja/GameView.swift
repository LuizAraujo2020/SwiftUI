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
    @State private var pointOfView = "mainCamera"

    var body: some View {
        ZStack {
            SceneView(scene: vm.scene,
                      pointOfView: vm.scene.rootNode.childNode(withName: pointOfView, recursively: true),
                      options: [.allowsCameraControl,
                                .autoenablesDefaultLighting
                      ],
            delegate: vm)
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
