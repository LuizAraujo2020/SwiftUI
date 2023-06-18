//
//  ShapeType.swift
//  SCNGeometryNinja
//
//  Created by Luiz Araujo on 18/06/23.
//

import GameplayKit

enum ShapeType: Int {
case box = 0
case sphere
case pyramid
case torus
case capsule
case cylinder
case cone
case tube
    
    static func random() -> ShapeType {
        let maxValue = tube.rawValue
        let rand = GKRandomDistribution(lowestValue: 0, highestValue: maxValue)
        return ShapeType(rawValue: rand.nextInt())!
    }
}
