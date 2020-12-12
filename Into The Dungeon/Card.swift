//
//  Card.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 12/5/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit

enum CardType: Int {
    case slash, guarD, moraleBoost, rage, shoot, block, hellFire, marked, headBash, shield, basicHeal, divineHeal, fireBlast, iceBarrier, divineLight, darkCloud, execute, uppercut, sharpenBlade, doubleEdgeSword, bullEyes, suppressFire, quickDraw, blindShot, godsWill, revive, haste, pray, unbreakableBarrier, lightningStrike, amplify, chaosWind
}

class Card: SKSpriteNode {
    var damage = 0
    var manaCost = 0
//    let damageLabel: SKLabelNode
    let cardType: CardType
    let frontTexture: SKTexture
    var cardName: String
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardType: CardType) {
        self.cardType = cardType
//        damageLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
//        damageLabel.name = "damageLabel"
//        damageLabel.fontSize = 12
//        damageLabel.fontColor = SKColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
//        damageLabel.text = "0"
//        damageLabel.position = CGPoint(x: 25, y: 40)
        
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
            cardName = "archer_hellfire"
        case .marked:
            frontTexture = SKTexture(imageNamed: "archer_marked")
            cardName = "archer_marked"
        case .headBash:
            frontTexture = SKTexture(imageNamed: "cleric_headbash")
            cardName = "cleric_headbash"
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
            // for shops
        case .execute:
            frontTexture = SKTexture(imageNamed: "warrior_execute")
            cardName = "warrior_execute"
        case .uppercut:
            frontTexture = SKTexture(imageNamed: "warrior_uppercut")
            cardName = "warrior_uppercut"
        case .sharpenBlade:
            frontTexture = SKTexture(imageNamed: "warrior_sharpenblade")
            cardName = "warrior_sharpenblade"
        case .doubleEdgeSword:
            frontTexture = SKTexture(imageNamed: "warrior_doubleEdgeSword")
            cardName = "warrior_doubleEdgeSword"
        case .bullEyes:
            frontTexture = SKTexture(imageNamed: "archer_bulleyes")
            cardName = "archer_bulleyes"
        case .suppressFire:
            frontTexture = SKTexture(imageNamed: "archer_suppressfire")
            cardName = "archer_suppressfire"
        case .quickDraw:
            frontTexture = SKTexture(imageNamed: "archer_quickdraw")
            cardName = "archer_quickdraw"
        case .blindShot:
            frontTexture = SKTexture(imageNamed: "archer_blindshot")
            cardName = "archer_blindshot"
        case .godsWill:
            frontTexture = SKTexture(imageNamed: "cleric_godswill")
            cardName = "cleric_godswill"
        case .revive:
            frontTexture = SKTexture(imageNamed: "cleric_revive")
            cardName = "cleric_revive"
        case .haste:
            frontTexture = SKTexture(imageNamed: "cleric_haste")
            cardName = "cleric_haste"
        case .pray:
            frontTexture = SKTexture(imageNamed: "cleric_pray")
            cardName = "cleric_pray"
        case .unbreakableBarrier:
            frontTexture = SKTexture(imageNamed: "mage_unbreakableBarrier")
            cardName = "mage_unbreakableBarrier"
        case .lightningStrike:
            frontTexture = SKTexture(imageNamed: "mage_lightningStrike")
            cardName = "mage_lightningStrike"
        case .amplify:
            frontTexture = SKTexture(imageNamed: "mage_amplify")
            cardName = "mage_amplify"
        case .chaosWind:
            frontTexture = SKTexture(imageNamed: "mage_chaosWind")
            cardName = "mage_chaosWind"
        }
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        self.name = cardName
//        addChild(damageLabel)
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
        case "archer_hellfire":
            return .hellFire
        case "archer_marked":
            return .marked
        case "cleric_headbash":
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
            // for shops
        case "warrior_execute":
            return .execute
        case "warrior_uppercut":
            return .uppercut
        case "warrior_sharpenblade":
            return .sharpenBlade
        case "warrior_doubleEdgeSword":
            return .doubleEdgeSword
        case "archer_bulleyes":
            return .bullEyes
        case "archer_suppressfire":
            return .suppressFire
        case "archer_quickdraw":
            return .quickDraw
        case "archer_blindshot":
            return .blindShot
        case "cleric_godswill":
            return .godsWill
        case "cleric_revive":
            return .revive
        case "cleric_haste":
            return .haste
        case "cleric_pray":
            return .pray
        case "mage_unbreakableBarrier":
            return .unbreakableBarrier
        case "mage_lightningStrike":
            return .lightningStrike
        case "mage_amplify":
            return .amplify
        case "mage_chaosWind":
            return .chaosWind
        default:
            return .shoot
        }
    }
}
