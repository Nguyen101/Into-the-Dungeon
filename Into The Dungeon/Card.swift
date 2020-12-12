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
    let damageLabel: SKLabelNode
    let cardType: CardType
    let frontTexture: SKTexture
    
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
        case .guarD:
            frontTexture = SKTexture(imageNamed: "warrior_guard")
        case .moraleBoost:
            frontTexture = SKTexture(imageNamed: "warrior_moraleBoost")
        case .rage:
        frontTexture = SKTexture(imageNamed: "warrior_rage")
        case .shoot:
            frontTexture = SKTexture(imageNamed: "archer_shoot")
        case .block:
            frontTexture = SKTexture(imageNamed:  "archer_block")
        case .hellFire:
            frontTexture = SKTexture(imageNamed: "archer_hellfire")
        case .marked:
            frontTexture = SKTexture(imageNamed: "archer_marked")
        case .headBash:
            frontTexture = SKTexture(imageNamed: "cleric_headbash")
        case .shield:
            frontTexture = SKTexture(imageNamed: "cleric_shield")
        case .basicHeal:
            frontTexture = SKTexture(imageNamed: "cleric_basicHeal")
        case .divineHeal:
            frontTexture = SKTexture(imageNamed: "cleric_divineHeal")
        case .fireBlast:
            frontTexture = SKTexture(imageNamed: "mage_fireBlast")
        case .iceBarrier:
            frontTexture = SKTexture(imageNamed: "mage_iceBarrier")
        case .divineLight:
            frontTexture = SKTexture(imageNamed: "mage_divineLight")
        case .darkCloud:
            frontTexture = SKTexture(imageNamed: "mage_darkCloud")
            // for shops
        case .execute:
            frontTexture = SKTexture(imageNamed: "warrior_execute")
        case .uppercut:
            frontTexture = SKTexture(imageNamed: "warrior_uppercut")
        case .sharpenBlade:
            frontTexture = SKTexture(imageNamed: "warrior_sharpenblade")
        case .doubleEdgeSword:
            frontTexture = SKTexture(imageNamed: "warrior_doubleEdgeSword")
        case .bullEyes:
            frontTexture = SKTexture(imageNamed: "archer_bulleyes")
        case .suppressFire:
            frontTexture = SKTexture(imageNamed: "archer_suppressfire")
        case .quickDraw:
            frontTexture = SKTexture(imageNamed: "archer_quickdraw")
        case .blindShot:
            frontTexture = SKTexture(imageNamed: "archer_blindshot")
        case .godsWill:
            frontTexture = SKTexture(imageNamed: "cleric_godswill")
        case .revive:
            frontTexture = SKTexture(imageNamed: "cleric_revive")
        case .haste:
            frontTexture = SKTexture(imageNamed: "cleric_haste")
        case .pray:
            frontTexture = SKTexture(imageNamed: "cleric_pray")
        case .unbreakableBarrier:
            frontTexture = SKTexture(imageNamed: "mage_unbreakableBarrier")
        case .lightningStrike:
            frontTexture = SKTexture(imageNamed: "mage_lightningStrike")
        case .amplify:
            frontTexture = SKTexture(imageNamed: "mage_amplify")
        case .chaosWind:
            frontTexture = SKTexture(imageNamed: "mage_chaosWind")
        }
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        addChild(damageLabel)
    }
}
