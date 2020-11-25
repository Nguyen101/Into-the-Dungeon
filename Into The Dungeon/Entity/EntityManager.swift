//
//  EntityManager.swift
//  Into The Dungeon
//
//  Created by Vy Nguyen on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

// repsonsible for adding or removing an entity from the scene
class EntityManager {
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        entities.remove(entity)
    }
    
    // spawn 4 enemies for 1-2 players and double when 3-4 players
    func spawnRegularCamp () {
        
    }
    // 1 boss for 1-2 players and 2 bosses for 3-4 players, each boss will have 4 regular enemies
    func spawnMiniBossCamp() {
        
    }
    // final boss will have 2 mini boss without any regular, but if 1 mini boss die, he will begin to spawn regular enemies only
    func spawnFinalBossCamp() {
        
    }
}
