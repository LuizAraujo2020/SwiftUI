//
//  GameViewModel.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import SwiftUI
import SceneKit

final class GameViewModel: NSObject, ObservableObject {
//    var scene: SCNScene?
    var scene = GameScene()
    
    /// Debug Options
    var showsStatistics: Bool = true
    var debugOptions: SCNDebugOptions = [.showBoundingBoxes, .showConstraints, .showCameras]

    override init() {
        super.init()
        
        
    }
}

extension GameViewModel: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
#if DEBUG
        renderer.showsStatistics = self.showsStatistics
            renderer.debugOptions = self.debugOptions
#else
        renderer.showsStatistics = false
        renderer.debugOptions = []
#endif
        // 1. You check if time (the current system time) is greater than spawnTime. If so, spawn a new shape; otherwise, do nothing.
        if time > scene.spawnTime {
            scene.spawnShape()

            // 2. After you spawn an object, update spawnTime with the next time to spawn a new object. The next spawn time is simply the current time incremented by a random amount. Since TimeInterval is in seconds, you spawn the next object between 0.2 seconds and 1.5 seconds after the current time.
            scene.spawnTime = time + TimeInterval(Float.random(min: 0.2, max: 1.5))
        }
    }
}

/// Resource to show FPS and other debug options and change it programmatically.
/// https://developer.apple.com/forums/thread/659873
