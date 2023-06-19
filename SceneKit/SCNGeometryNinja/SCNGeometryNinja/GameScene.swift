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
        case .box:
            geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        case .capsule:
            geometry = SCNCapsule(capRadius: 0.2, height: 1)
        case .cone:
            geometry = SCNCone(topRadius: 0.01, bottomRadius: 1, height: 1)
        case .cylinder:
            geometry = SCNCylinder(radius: 1, height: 1)
        case .pyramid:
            geometry = SCNPyramid(width: 1, height: 1, length: 1)
        case .sphere:
            geometry = SCNSphere(radius: 1)
        case .torus:
            geometry = SCNTorus(ringRadius: 1, pipeRadius: 1)
        case .tube:
            geometry = SCNTube(innerRadius: 1, outerRadius: 1, height: 1)
        }
        
        let node = SCNNode(geometry: geometry)
        node.physicsBody = SCNPhysicsBody(type: .dynamic,
                                          shape: nil)

        let randomX = Float.random(min: -2, max: 2)
        let randomY = Float.random(min: 10, max: 18)

        let force = SCNVector3(x: randomX, y: randomY , z: 0)

        let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)

        node.physicsBody?.applyForce(force,
          at: position, asImpulse: true)

        
        self.rootNode.addChildNode(node)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
