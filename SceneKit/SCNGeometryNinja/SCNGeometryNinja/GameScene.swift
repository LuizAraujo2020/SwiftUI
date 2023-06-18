//
//  GameScene.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import SceneKit

final class GameScene: SCNScene {
    var cameraNode: SCNNode!

    override init() {
        super.init()
        
        setupScene()
        setupCamera()
        
        spawnShape()
    }
    
    func setupScene() {
        self.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
        
    }
    
    private func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(
            x: 0,
            y: 0,
            z: 10)
        self.rootNode.addChildNode(cameraNode)
    }
    
    private func spawnShape() {
        var geometry: SCNGeometry
        
        switch ShapeType.random() {
        default:
            geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        }
        
        let node = SCNNode(geometry: geometry)
        
        self.rootNode.addChildNode(node)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
