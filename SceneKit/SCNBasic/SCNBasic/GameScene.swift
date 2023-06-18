//
//  GameScene.swift
//  SCNBasic
//
//  Created by Luiz Araujo on 17/06/23.
//

import SceneKit

final class GameScene: NSObject, SCNSceneRendererDelegate {
    
    var scene: SCNScene = SCNScene(named: "HUB.scn")!
    
    var cameraNode: SCNNode!
    var lightNode: SCNNode!
    
    var cubeNode: SCNNode!
    var planeNode: SCNNode!
    
    override init() {
        super.init()
        
        setUpScene()
    }
    
    private func setUpScene() {
        
        setUpCamera()
        setUpLight()
        setUpCube()
        setUpPlane()
    }
    
    private func setUpCamera() {
        
        guard let cam = scene.rootNode.childNode(withName: "camera", recursively: false)
        else { return }
        
        cameraNode = cam
        cameraNode.position = SCNVector3(x: -3, y: 2, z: 3)
        
        let constraint = SCNLookAtConstraint(target: cubeNode)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        
        scene.rootNode.addChildNode(cameraNode)
    }
    
    private func setUpLight() {
        
        let light = SCNLight()
        light.type = .spot
        light.spotInnerAngle = 30
        light.spotOuterAngle = 80
        light.castsShadow = true
        
        lightNode = SCNNode()
        lightNode.light = light
//        lightNode.position = SCNVector3(x: 1.5,
//                                        y: 1.5,
//                                        z: 1.5)
        lightNode.position = SCNVector3(x: 0,
                                        y: 1,
                                        z: 2)
        
        let constraint = SCNLookAtConstraint(target: cubeNode)
        constraint.isGimbalLockEnabled = true
        lightNode.constraints  = [constraint]
        
        scene.rootNode.addChildNode(lightNode)
        
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor(
            red: 0.2,
            green: 0.2,
            blue: 0.2,
            alpha: 1)
        cameraNode.light = ambientLight
    }
    
    private func setUpCube() {
        
        let cubeGeometry = SCNBox(width: 1,
                                  height: 1,
                                  length: 1,
                                  chamferRadius: 0.1)
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red
        cubeGeometry.materials = [redMaterial]
        
        cubeNode = SCNNode(geometry: cubeGeometry)
        
        scene.rootNode.addChildNode(cubeNode)
    }
    
    private func setUpPlane() {
        let planeGeometry = SCNPlane(width: 50, height: 50)
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green
        planeGeometry.materials = [greenMaterial]
        
        planeNode = SCNNode(geometry: planeGeometry)
        planeNode.eulerAngles = SCNVector3(
            x: GLKMathDegreesToRadians(-90),
            y: 0,
            z: 0)
        planeNode.position = SCNVector3(
            x: 0,
            y: -0.5,
            z: 0)
        
        scene.rootNode.addChildNode(planeNode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
