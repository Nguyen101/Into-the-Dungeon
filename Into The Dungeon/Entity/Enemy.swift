//
//  Enemy.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 11/25/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//


import SpriteKit
import GameplayKit


// use for spawning enemy camp
class Enemy: GKEntity {
    init (imageName: String , team: Team) {
        super.init()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
