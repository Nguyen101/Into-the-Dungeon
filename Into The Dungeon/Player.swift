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
    var currentHP: Int
    var Speed: Int
    var Evasion: Int
    var manaPool: Int
    var currentDeck = [Card]()
    var currentHand = [Card]()
    var discardPile = [Card]()
    var defensePoint = 0
    let HPLabel: SKLabelNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(playerType: PlayerType) {
        
        self.playerType = playerType
        switch playerType {
        case .warrior:
            playerImage = SKTexture(imageNamed: "player_warrior")
            self.HP = 200
            self.currentHP = 200
            self.Speed = 1
            self.Evasion = 1
            self.manaPool = 3
        case .archer:
            playerImage = SKTexture(imageNamed: "player_archer")
            self.HP = 150
            self.currentHP = 150
            self.Speed = 2
            self.Evasion = 3
            self.manaPool = 3
        case .cleric:
            playerImage = SKTexture(imageNamed: "player_cleric")
            self.HP = 100
            self.currentHP = 100
            self.Speed = 2
            self.Evasion = 1
            self.manaPool = 3
        case .mage:
            playerImage = SKTexture(imageNamed: "player_mage")
            self.HP = 150
            self.currentHP = 150
            self.Speed = 2
            self.Evasion = 1
            self.manaPool = 3
        }
        
        
        HPLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
        
        super.init(texture: playerImage, color: .clear, size: playerImage.size())
        
        HPLabel.name = "hitpointlabel"
        HPLabel.fontSize = 12
        HPLabel.fontColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        HPLabel.text = String(currentHP)
        HPLabel.position = CGPoint(x: 0, y: 40)
        
        addChild(HPLabel)
    }
    
    // invoke when user choose to heal
    func rest() {
        self.currentHP = self.currentHP + (self.HP * Int(0.10))
    }
    // invoke when user buy a card
    func addACard(newCard: Card) {
        self.currentDeck.append(newCard)
    }
    // basic attack
    func attack(cardPlayed: Card, target: Enemy){
        let blockAmount = Int.random(in: target.minBlockRange...target.maxBlockRange)
        switch cardPlayed.cardType {
        case .slash:
            target.currentHP -= (200 - blockAmount)
        case .shoot:
            target.currentHP -= (160 - blockAmount)
        case .marked:
            target.currentHP -= (200 - blockAmount)
        case .headBash:
            target.currentHP -= (180 - blockAmount)
        case .fireBlast:
            target.currentHP -= (250 - blockAmount)
        default:
            print("unknown action")
        }
        if target.currentHP < 0 {
            target.currentHP = 0
        }
    }
    // basic block
    func defend(cardPlayed: Card) {
        switch cardPlayed.cardType {
        case .guarD:
            defensePoint += 100
        case .moraleBoost:
            defensePoint += 120
        case .block:
            defensePoint += 130
        case .shield:
            defensePoint += 140
        case .basicHeal:
            defensePoint += 160
        case .iceBarrier:
            defensePoint += 120
        case .divineLight:
            defensePoint += 180
        default:
            print("unknown action")
        }
    }
    func specialAbility(cardPlayed: Card, targets: [Enemy], targetNum: Int, currTeam: [Player], buffTarget: Player) {
        
    }
    func drawCard() {
        let randomInt = Int.random(in: 1..<currentDeck.count)
        currentHand.append(currentDeck[randomInt])
        currentDeck.remove(at: randomInt)
    }
    
    
}
