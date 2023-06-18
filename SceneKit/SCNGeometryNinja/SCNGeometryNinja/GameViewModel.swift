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
        
        
    }
}

/// Resource to show FPS and other debug options and change it programmatically.
/// https://developer.apple.com/forums/thread/659873
