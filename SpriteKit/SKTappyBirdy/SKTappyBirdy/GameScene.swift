//
//  GameScene.swift
//  SKTappyBirdy
//
//  Created by Luiz Araujo on 17/06/23.
//

import SwiftUI
import SpriteKit

final class GameScene: SKScene, ObservableObject {
    
    let player = SKSpriteNode(
        color: .red,
        size: CGSize(
            width: 50,
            height: 50))
    
    override func didMove(to view: SKView) {
        self.size = UIScreen.main.bounds.size
        
        self.scene?.scaleMode = .fill
        
        self.anchorPoint = .zero
        
        self.player.position = CGPoint(
            x: 0 + player.size.width * 0.5,
            y: self.size.height - player.size.height * 0.5)
//        self.player.setScale(0.35)
        player.zPosition = 10
        
        self.addChild(player)
        
//        moveBackground(image: <#T##String#>,
//                       y: <#T##CGFloat#>,
//                       z: <#T##CGFloat#>,
//                       duration: <#T##Double#>,
//                       needPhysics: <#T##Bool#>,
//                       size: <#T##CGSize#>)
        
    }
    
    func moveBackground(image: String,
                        y: CGFloat,
                        z: CGFloat,
                        duration: Double,
                        needPhysics: Bool,
                        size: CGSize) {
        
        for i in 0...1 {
            let node = SKSpriteNode(imageNamed: image)
            
            node.anchorPoint = CGPoint.zero
            node.size = size
            node.position = CGPoint(x: size.width * CGFloat(i),
                                    y: y)
            node.zPosition = z
            
            if needPhysics {
                node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                node.physicsBody?.isDynamic = false
                node.physicsBody?.contactTestBitMask = 1
                node.name = "gegner"
            }
            
            let move = SKAction.moveBy(x: -node.size.width,
                                       y: 0,
                                       duration: duration)
            let wrap = SKAction.moveBy(x: node.size.width,
                                       y: 0,
                                       duration: 0)
            let sequence = SKAction.sequence([move, wrap])
            let action = SKAction.repeatForever(sequence)
            
            node.run(action)
            
            addChild(node)
        }
    }
}
