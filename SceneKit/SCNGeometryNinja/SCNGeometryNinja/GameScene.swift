//
//  GameScene.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import SceneKit

final class GameScene: SCNScene {
    var cameraNode: SCNNode!
    var spawnTime: TimeInterval = 0
    var game = GameHelper.sharedInstance

    override init() {
        super.init()
        
        setupScene()
        setupCamera()
        setupHUD()

    }
    
    func setupScene() {
        self.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
    }
    
    private func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)

        self.rootNode.addChildNode(cameraNode)
    }

    func spawnShape() {
        var geometry: SCNGeometry
        
        switch ShapeType.random() {
            case .box:
                geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
            case .capsule:
                geometry = SCNCapsule(capRadius: 0.2, height: 1)
            case .cone:
                geometry = SCNCone(topRadius: 0.0, bottomRadius: 1, height: 1)
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

        let color = UIColor.random()
        geometry.materials.first?.diffuse.contents = color

        let node = SCNNode(geometry: geometry)
        node.physicsBody = SCNPhysicsBody(type: .dynamic,
                                          shape: nil)

        let randomX = Float.random(min: -2, max: 2)
        let randomY = Float.random(min: 10, max: 18)

        let force = SCNVector3(x: randomX, y: randomY , z: 0)

        let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)

        node.physicsBody?.applyForce(force,
                                     at: position, asImpulse: true)

        let trailEmitter = createTrail(color: color, geometry: geometry)
        node.addParticleSystem(trailEmitter)

        if color == UIColor.black {
            node.name = "BAD"
        } else {
            node.name = "GOOD"
        }

        self.rootNode.addChildNode(node)
    }

    func cleanScene() {
        // 1
        for node in self.rootNode.childNodes {
            // 2
            if node.presentation.position.y < -2 {
                // 3
                node.removeFromParentNode()
            }
        }
    }

    // 1. This defines createTrail(_: geometry:) which takes in color and geometry parameters to set up the particle system.
    func createTrail(color: UIColor, geometry: SCNGeometry) ->
    SCNParticleSystem {
        // 2. This loads the particle system from the file you created earlier.
        let trail = SCNParticleSystem(named: "Trail.scnp", inDirectory: nil)!
        // 3. Here, you modify the particle’s tint color based on the parameter passed in.
        trail.particleColor = color
        // 4. This uses the geometry parameter to specify the emitter’s shape.
        trail.emitterShape = geometry
        // 5. Finally, this returns the newly created particle system.
        return trail
    }
    func setupHUD() {
        game.hudNode.position = SCNVector3(x: 0.0, y: 10.0, z: 0.0)
        self.rootNode.addChildNode(game.hudNode)
    }

    func handleTouchFor(node: SCNNode) {
        if node.name == "GOOD" {
            game.score += 1

        } else if node.name == "BAD" {
            game.lives -= 1
        }
        
        node.removeFromParentNode()
    }

    required init?(coder: NSCoder) { nil }
}
