//
//  Enemy.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 12/10/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

enum EnemyType: Int {
    case guarD, archer, doctor, mage, greatLancer, theExecutor, corruptKing
}

class Enemy: SKSpriteNode {
    let enemyType: EnemyType
    let enemyImage: SKTexture
    var HP: Int
    var currentHP: Int
    var Speed: Int
    var evasion: Int
    var minDamageRange: Int
    var maxDamageRange: Int
    var minBlockRange: Int
    var maxBlockRange: Int
    var defense = 0
    let HPLabel: SKLabelNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    init(enemyType: EnemyType) {
        self.enemyType = enemyType
        switch enemyType {
        case .guarD:
            enemyImage = SKTexture(imageNamed: "enemy_guard")
            self.HP = 400
            self.currentHP = 400
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .archer:
            enemyImage = SKTexture(imageNamed: "enemy_archer")
            self.HP = 300
            self.currentHP = 300
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .doctor:
            enemyImage = SKTexture(imageNamed: "enemy_doctor")
            self.HP = 300
            self.currentHP = 300
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .mage:
            enemyImage = SKTexture(imageNamed: "enemy_mage")
            self.HP = 250
            self.currentHP = 250
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .greatLancer:
            enemyImage = SKTexture(imageNamed: "enemy_great_lancer")
            self.HP = 800
            self.currentHP = 800
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .theExecutor:
            enemyImage = SKTexture(imageNamed: "enemy_the_executor")
            self.HP = 750
            self.currentHP = 750
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .corruptKing:
            enemyImage = SKTexture(imageNamed: "enemy_corrupt_king")
            self.HP = 1000
            self.currentHP = 1000
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        }
        
        HPLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
        
        super.init(texture: enemyImage, color: .clear, size: enemyImage.size())
        
        HPLabel.name = "hitpointlabel"
        HPLabel.fontSize = 12
        HPLabel.fontColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        HPLabel.text = String(currentHP)
        HPLabel.position = CGPoint(x: 0, y: 40)
        
        addChild(HPLabel)
    }
    
    //checks to see if the node clicked was an enemy
    static func wasItAnEnemyClicked(nodeName: String) -> Bool {
        switch nodeName {
        case "enemy_guard",
             "enemy_archer",
             "enemy_doctor",
             "enemy_mage",
             "enemy_great_lancer",
             "enemy_the_executor",
             "enemy_corrupt_king":
            return true
        default:
            return false
        }
    }
    
    
    
    
    // Guard abilities
    // SLASH:
    // Slash a player for a random amount of damage
    func slash(target: Player) {
        let randomInt = Int.random(in: minDamageRange..<maxDamageRange)
        // take damage if the enemy hit damage is greater than the current defense point of the player
        if target.defensePoint < randomInt {
            let damageTaken = randomInt - target.defensePoint
            target.HP -= damageTaken
        } else {
            target.defensePoint -= randomInt
        }
    }
    
    // SHIELD:
    // Shield from an incoming attack
    func shield() {
        let randomInt = Int.random(in: minBlockRange..<maxBlockRange)
        self.defense = randomInt
    }
    
    // Archer's abilities
    // Shoot at a target for a random amount of damage
    func shoot(target: Player) {
        let randomInt = Int.random(in: minDamageRange..<maxDamageRange)
        // take damage if the enemy hit damage is greater than the current defense point of the player
        if target.defensePoint < randomInt {
            let damageTaken = randomInt - target.defensePoint
            target.HP -= damageTaken
        } else {
            target.defensePoint -= randomInt
        }
    }
    
    // BLOCK:
    // Block an incoming attack
    func block() {
        let randomInt = Int.random(in: minBlockRange..<maxBlockRange)
        self.defense = randomInt
    }
    
    // Doctor's abilities
    // HEAL:
    // Heal itself or a random target for a random amount
    func heal(target: [Enemy]) {
        let randomInt = Int.random(in: 0..<target.count-1)
        let maxHeal = 100
        let randomHeal = Int.random(in: 0..<maxHeal)
        target[randomInt].currentHP += randomHeal
    }
    
    // SMOKE SCREEN:
    // Reduce an incoming attack
    func smokeScreen() {
        let randomInt = Int.random(in: minBlockRange..<maxBlockRange)
        self.defense = randomInt
    }
    // Mage's abilities
    // FIREBALL:
    // Launch a fireball and deal a random amount of damage
    func fireBall(target: Player) {
        let randomInt = Int.random(in: minDamageRange..<maxDamageRange)
        // take damage if the enemy hit damage is greater than the current defense point of the player
        if target.defensePoint < randomInt {
            let damageTaken = randomInt - target.defensePoint
            target.HP -= damageTaken
        } else {
            target.defensePoint -= randomInt
        }
    }
    
    // ICE SHIELD:
    // Temporary create an ice shield to block an incoming attack
    func iceShield() {
        let randomInt = Int.random(in: minBlockRange..<maxBlockRange)
        self.defense = randomInt
    }
    
    // Great Lancer Abilities
    // CHARGE:
    // Deal 10% of player HP
    // speed - 1 for 3 turns
    // self speed + 3f for 2 turns
    func charge(target: Player) {
        target.currentHP -= (target.HP * Int(0.10))
        target.Speed -= 1
        self.speed += 3
    }
    
    // WITHSTAND:
    // Increase evasion by 2
    // Increase block range by 50 for both min and max
    // Heal for 50 flat
    func withStand() {
        self.evasion += 2
        self.minBlockRange += 50
        self.maxBlockRange += 50
        self.currentHP += 50
    }
    
    
    // The executor's abilities
    // SLICE AND DICE:
    // Hit all players and deal 5% of their max HP
    // Increase evasion by 2
    func sliceDice(target: [Player]) {
        for x in target {
            x.currentHP -= (x.HP * Int(0.50))
        }
        self.evasion += 2
    }
    //  TOUGH SKIN:
    //  Increase min and max block range by 100
    //  Heal for 100 flat
    //  Increase evasion by 1 for 2 turns
    func toughSkin() {
        self.minBlockRange += 100
        self.maxBlockRange += 100
        self.currentHP += 100
        self.evasion += 1
    }
    
    // King's abilities
    //  EMPOWER:
    //  Empower all enemies on the battle field
    //  Increase all their stats by flat amount: Speed + 2, Evasion + 1, min-max damage + 50, min-max block + 50
    // NOTE: CANNOT USE FOR THE NEXT TURN
    func empower(minions: [Enemy]) {
        for x in minions {
            x.Speed += 2
            x.evasion += 1
            x.minDamageRange += 50
            x.maxDamageRange += 50
            x.minBlockRange += 50
            x.maxBlockRange += 50
        }
    }
    
    // COMMAND:
    // Command an enemy to hit a random player, heal if they are a doctor, if they choose themselves then use command again
    func command(target: [Player], minion: [Enemy]) {
        let randomMinion = Int.random(in: 0..<minion.count-1)
        let randomPlayer = Int.random(in: 0..<target.count-1)
        
        switch minion[randomMinion].enemyType{
        case .guarD : minion[randomMinion].slash(target:target[randomPlayer])
        case .archer: minion[randomMinion].shoot(target: target[randomPlayer])
        case .doctor: minion[randomMinion].heal(target: minion)
        case .mage: minion[randomMinion].fireBall(target: target[randomPlayer])
        case .corruptKing: minion[randomMinion].command(target: target, minion: minion)
        case .greatLancer,
             .theExecutor: print("")
        }
    }
    
}
