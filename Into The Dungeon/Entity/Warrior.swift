//
//  Warrior.swift
//  Into The Dungeon
//
//  Created by Vy Nguyen on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit

class Warrior: GKEntity {
    init (imageName: String , team: Team, warrior: Warrior) {
        super.init()
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        addComponent(WarriorComponents())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
