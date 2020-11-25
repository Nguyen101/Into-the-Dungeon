//
//  Archer.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 11/25/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import  GameplayKit
import SpriteKit

class Archer: GKEntity {
    init (imageName: String , team: Team) {
        super.init()
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
        addComponent(ArcherComponents())
        addComponent(TeamComponent(team:team))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
