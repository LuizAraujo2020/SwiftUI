//
//  GameViewModel.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import SwiftUI
import SceneKit

final class GameViewModel: NSObject, ObservableObject {
    @Published var scene = GameScene()
}
