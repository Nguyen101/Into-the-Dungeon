//
//  Player.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 12/10/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

enum PlayerType: Int {
    case warrior, archer, cleric, mage
}

class Player: SKSpriteNode {
    let playerType: PlayerType
    let playerImage: SKTexture
    var HP: Int
    var Speed: Int
    var Evasion: Int
    var manaPool: Int
    var currentDeck = [Card]()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    init(playerType: PlayerType) {
        self.playerType = playerType
        switch playerType {
        case .warrior:
            playerImage = SKTexture(imageNamed: "player_warrior")
            self.HP = 200
            self.Speed = 1
            self.Evasion = 1
            self.manaPool = 3
        case .archer:
            playerImage = SKTexture(imageNamed: "player_archer")
            self.HP = 150
            self.Speed = 2
            self.Evasion = 3
            self.manaPool = 3
        case .cleric:
            playerImage = SKTexture(imageNamed: "player_cleric")
            self.HP = 100
            self.Speed = 2
            self.Evasion = 1
            self.manaPool = 3
        case .mage:
            playerImage = SKTexture(imageNamed: "player_mage")
            self.HP = 150
            self.Speed = 2
            self.Evasion = 1
            self.manaPool = 3
        }
        super.init(texture: playerImage, color: .clear, size: playerImage.size())
    }
    
}
