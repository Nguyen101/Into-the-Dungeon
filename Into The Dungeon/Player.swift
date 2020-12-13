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
        super.init(texture: playerImage, color: .clear, size: playerImage.size())
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
    func attack(cardPlayed: Card, target: Enemy) {
        switch cardPlayed.cardType {
        case .slash:
            target.HP -= 100
        case .shoot:
            target.HP -= 100
        case .marked:
            target.HP -= 100
        case .headBash:
            target.HP -= 100
        case .fireBlast:
            target.HP -= 100
        default:
            print("unknown action")
        }
    }
    // basic block
    func defend(cardPlayed: Card) {
        switch cardPlayed.cardType {
        case .guarD:
            HP += 100
        case .moraleBoost:
            HP += 100
        case .block:
            HP += 100
        case .shield:
            HP += 100
        case .basicHeal:
            HP += 100
        case .iceBarrier:
            HP += 100
        case .divineLight:
            HP += 100
        default:
            print("unknown action")
        }
    }
    func specialAbility(cardPlayed: Card, targets: [Enemy], targetNum: Int, currTeam: [Player], buffTarget: Player) {
        
    }
    func drawCard() {
        var randomInt = Int.random(in: 1..<currentDeck.count)
        currentHand.append(currentDeck[randomInt])
        currentDeck.remove(at: randomInt)
    }
    
    
}
