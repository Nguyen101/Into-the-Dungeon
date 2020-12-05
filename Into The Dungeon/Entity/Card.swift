//
//  Card.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 12/5/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit

enum CardType: Int {
    case slash, guarD, moraleBoost, rage, shoot, block, hellFire, marked, headBash, shield, basicHeal, divineHeal, fireBlast, iceBarrier, shiningLight, darkCloud, execute, uppercut, sharpenBlade, doubleEdgeSword, bullEyes, suppressFire, quickDraw, blindShot, godsWill, revive, haste, pray, unbreakableBarrier, lightningStrike, amplify, chaosWind
}

class Card: SKSpriteNode {
    var damage = 0
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
            frontTexture = SKTexture(imageNamed: "card_warrior_slash")
        case .guarD:
            frontTexture = SKTexture(imageNamed: "card_warrior_guard")
        case .moraleBoost:
            frontTexture = SKTexture(imageNamed: "card_warrior_moraleBoost")
        case .rage:
        frontTexture = SKTexture(imageNamed: "card_warrior_rage")
        case .shoot:
            frontTexture = SKTexture(imageNamed: "card_archer_shoot")
        case .block:
            frontTexture = SKTexture(imageNamed:  "card_archer_block")
        case .hellFire:
            frontTexture = SKTexture(imageNamed: "card_archer_hellfire")
        case .marked:
            frontTexture = SKTexture(imageNamed: "card_archer_marked")
        case .headBash:
            frontTexture = SKTexture(imageNamed: "card_cleric_headbash")
        case .shield:
            frontTexture = SKTexture(imageNamed: "card_cleric_shield")
        case .basicHeal:
            frontTexture = SKTexture(imageNamed: "card_cleric_basicHeal")
        case .divineHeal:
            frontTexture = SKTexture(imageNamed: "card_cleric_divineHeal")
        case .fireBlast:
            frontTexture = SKTexture(imageNamed: "card_mage_fireblast")
        case .iceBarrier:
            frontTexture = SKTexture(imageNamed: "card_mage_iceBarrier")
        case .shiningLight:
            frontTexture = SKTexture(imageNamed: "card_mage_shiningLight")
        case .darkCloud:
            frontTexture = SKTexture(imageNamed: "card_mage_darkCloud")
            // for shops 
        case .execute:
            frontTexture = SKTexture(imageNamed: "card_warrior_execute")
        case .uppercut:
            frontTexture = SKTexture(imageNamed: "card_warrior_uppercut")
        case .sharpenBlade:
            frontTexture = SKTexture(imageNamed: "card_warrior_sharpenblade")
        case .doubleEdgeSword:
            frontTexture = SKTexture(imageNamed: "card_warrior_doubleEdgeSword")
        case .bullEyes:
            frontTexture = SKTexture(imageNamed: "card_archer_bulleyes")
        case .suppressFire:
            frontTexture = SKTexture(imageNamed: "card_archer_suppressfire")
        case .quickDraw:
            frontTexture = SKTexture(imageNamed: "card_archer_quickdraw")
        case .blindShot:
            frontTexture = SKTexture(imageNamed: "card_archer_blindshot")
        case .godsWill:
            frontTexture = SKTexture(imageNamed: "card_archer_godswill")
        case .revive:
            frontTexture = SKTexture(imageNamed: "card_archer_revive")
        case .haste:
            frontTexture = SKTexture(imageNamed: "card_cleric_haste")
        case .pray:
            frontTexture = SKTexture(imageNamed: "card_cleric_pray")
        case .unbreakableBarrier:
            frontTexture = SKTexture(imageNamed: "card_mage_unbreakableBarrier")
        case .lightningStrike:
            frontTexture = SKTexture(imageNamed: "card_mage_lightningStrike")
        case .amplify:
            frontTexture = SKTexture(imageNamed: "card_mage_amplify")
        case .chaosWind:
            frontTexture = SKTexture(imageNamed: "card_mage_chaosWind")
        }
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        addChild(damageLabel)
    }
}
