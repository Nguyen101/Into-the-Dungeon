//
//  Card.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 12/5/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//
// Card Design made by Card Creatr Studio - cardcreatr.sffc.xyz
// Art drawn by Jasper Corcoran
import SpriteKit

enum CardType: Int {
    case slash, guarD, moraleBoost, rage, shoot, block, hellFire, marked, headBash, shield, basicHeal, divineHeal, fireBlast, iceBarrier, divineLight, darkCloud
}

class Card: SKSpriteNode {
    var damage = 0
    var manaCost = 0
    let damageLabel: SKLabelNode
    let cardType: CardType
    let frontTexture: SKTexture
    var cardName: String
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardType: CardType) {
        self.cardType = cardType
        damageLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
        damageLabel.name = "damageLabel"
        damageLabel.fontSize = 12
        damageLabel.fontColor = SKColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
        damageLabel.text = "0"
        damageLabel.position = CGPoint(x: 25, y: 40)
        
        switch cardType {
        // basic deck
        case .slash:
            frontTexture = SKTexture(imageNamed: "warrior_slash")
            cardName = "warrior_slash"
        case .guarD:
            frontTexture = SKTexture(imageNamed: "warrior_guard")
            cardName = "warrior_guard"
        case .moraleBoost:
            frontTexture = SKTexture(imageNamed: "warrior_moraleBoost")
            cardName = "warrior_moraleBoost"
        case .rage:
            frontTexture = SKTexture(imageNamed: "warrior_rage")
            cardName = "warrior_rage"
        case .shoot:
            frontTexture = SKTexture(imageNamed: "archer_shoot")
            cardName = "archer_shoot"
        case .block:
            frontTexture = SKTexture(imageNamed:  "archer_block")
            cardName = "archer_block"
        case .hellFire:
            frontTexture = SKTexture(imageNamed: "archer_hellfire")
            cardName = "archer_hellFire"
        case .marked:
            frontTexture = SKTexture(imageNamed: "archer_marked")
            cardName = "archer_marked"
        case .headBash:
            frontTexture = SKTexture(imageNamed: "cleric_headbash")
            cardName = "cleric_headBash"
        case .shield:
            frontTexture = SKTexture(imageNamed: "cleric_shield")
            cardName = "cleric_shield"
        case .basicHeal:
            frontTexture = SKTexture(imageNamed: "cleric_basicHeal")
            cardName = "cleric_basicHeal"
        case .divineHeal:
            frontTexture = SKTexture(imageNamed: "cleric_divineHeal")
            cardName = "cleric_divineHeal"
        case .fireBlast:
            frontTexture = SKTexture(imageNamed: "mage_fireBlast")
            cardName = "mage_fireBlast"
        case .iceBarrier:
            frontTexture = SKTexture(imageNamed: "mage_iceBarrier")
            cardName = "mage_iceBarrier"
        case .divineLight:
            frontTexture = SKTexture(imageNamed: "mage_divineLight")
            cardName = "mage_divineLight"
        case .darkCloud:
            frontTexture = SKTexture(imageNamed: "mage_darkCloud")
            cardName = "mage_darkCloud"
            
        }
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        self.name = cardName
        addChild(damageLabel)
    }
    
    /*
     gets the crad type from a card name
     */
    static func getCardType(cardName: String) -> CardType {
        switch cardName {
        // basic deck
        case "warrior_slash":
            return .slash
        case "warrior_guard":
            return .guarD
        case "warrior_moraleBoost":
            return .moraleBoost
        case "warrior_rage":
            return .rage
        case "archer_shoot":
            return .shoot
        case "archer_block":
            return .block
        case "archer_hellFire":
            return .hellFire
        case "archer_marked":
            return .marked
        case "cleric_headBash":
            return .headBash
        case "cleric_shield":
            return .shield
        case "cleric_basicHeal":
            return .basicHeal
        case "cleric_divineHeal":
            return .divineHeal
        case "mage_fireBlast":
            return .fireBlast
        case "mage_iceBarrier":
            return .iceBarrier
        case "mage_divineLight":
            return .divineLight
        case "mage_darkCloud":
            return .darkCloud
        default:
            return .shoot
        }
    }
    
    //checks to see if the node that was touched was a card
    static func wasItACardClicked(nodename: String) -> Bool{
        switch nodename {
        // basic deck
        case "warrior_slash",
         "warrior_guard",
         "warrior_moraleBoost",
         "warrior_rage",
         "archer_shoot",
         "archer_block",
         "archer_hellFire",
         "archer_marked",
         "cleric_headBash",
         "cleric_shield",
         "cleric_basicHeal",
         "cleric_divineHeal",
         "mage_fireBlast",
         "mage_iceBarrier",
         "mage_divineLight",
         "mage_darkCloud":
            return true
        default:
            return false
        }
    }
}
