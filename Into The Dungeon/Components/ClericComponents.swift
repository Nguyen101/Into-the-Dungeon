//
//  ClericComponents.swift
//  Into The Dungeon
//
//  Created by Vy Nguyen on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit

class ClericComponents: GKComponent {
    // Base Stats
    var hitPoints: Int = 200
    var speed: Int = 2
    var evasion: Int = 2
    var manaPool: Int = 3
    
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //update the frame of  entity action
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}
