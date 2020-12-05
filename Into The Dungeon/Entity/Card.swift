//
//  Card.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 12/5/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit

enum CardType: Int {
    case execute, uppercut, sharpenBlade, doubleEdgeSword, bullEyes, suppressFire, quickDraw, blindShot, godsWill, revive, haste, pray, unbreakableBarrier, lightningStrike, amplify, chaosWind
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
        case .execute:
            frontTexture = SKTexture(imageNamed: "card_warrior_execute")
        case .uppercut:
            frontTexture = SKTexture(imageNamed: "card_warrior_uppercut")
        case .sharpenBlade:
            frontTexture = SKTexture(imageNamed: "card_warrior_sharpenblade")
        case .bullEyes:
            frontTexture = SKTexture(imageNamed: "card_warrior_bulleyes")
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
        case .doubleEdgeSword:
            frontTexture = SKTexture(imageNamed: "card_warrior_doubleEdgeSword")
        case .chaosWind:
            frontTexture = SKTexture(imageNamed: "card_mage_chaosWind")
        }
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        addChild(damageLabel)
    }
}
