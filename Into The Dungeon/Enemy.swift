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
    var Speed: Int
    var evasion: Int
    var minDamageRange: Int
    var maxDamageRange: Int
    var minBlockRange: Int
    var maxBlockRange: Int
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    init(enemyType: EnemyType) {
        self.enemyType = enemyType
        switch enemyType {
        case .guarD:
            enemyImage = SKTexture(imageNamed: "enemy_guard")
            self.HP = 400
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .archer:
            enemyImage = SKTexture(imageNamed: "enemy_archer")
            self.HP = 300
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .doctor:
            enemyImage = SKTexture(imageNamed: "enemy_doctor")
            self.HP = 300
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .mage:
            enemyImage = SKTexture(imageNamed: "enemy_mage")
            self.HP = 250
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .greatLancer:
            enemyImage = SKTexture(imageNamed: "enemy_great_lancer")
            self.HP = 800
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .theExecutor:
            enemyImage = SKTexture(imageNamed: "enemy_the_executor")
            self.HP = 750
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        case .corruptKing:
            enemyImage = SKTexture(imageNamed: "enemy_corrupt_king")
            self.HP = 1000
            self.Speed = 2
            self.evasion = 1
            self.minDamageRange = 10
            self.maxDamageRange = 50
            self.minBlockRange = 50
            self.maxBlockRange = 100
        }
        super.init(texture: enemyImage, color: .clear, size: enemyImage.size())
    }
    
    
    // Guard abilities
    // SLASH:
    // Slash a player for a random amount of damage
    func slash(target: Player) {
        
    }
    
    // SHIELD:
    // Shield from an incoming attack
    func shield() {
        
    }
    
    // Archer's abilities
    // Shoot at a target for a random amount of damage
    func shoot(target: Player) {
        
    }
    
    // BLOCK:
    // Block an incoming attack
    func block() {
        
    }
    
    // Doctor's abilities
    // HEAL:
    // Heal itself or a random target for a random amount
    func heal(target: [Enemy]) {
        
    }
    
    func smokeScreen() {
        
    }
    // Mage's abilities
    // FIREBALL:
    // Launch a fireball and deal a random amount of damage
    func fireBall(target: Player) {
        
    }
    
    // ICE SHIELD:
    // Temporary create an ice shield to block an incoming attack
    func iceShield() {
        
    }
    
    // Great Lancer Abilities
    // CHARGE:
    // Deal 10% of player HP
    // speed - 1 for 3 turns
    // self speed + 3f for 2 turns
    func charge(target: Player) {
        
    }
    
    // WITHSTAND:
    // Increase evasion by 2
    // Increase block range by 50 for both min and max
    // Heal for 50 flat
    func withStand() {
        
    }
    
    
    // The executor's abilities
    // SLICE AND DICE:
    // Hit all players and deal 5% of their max HP
    // Decrease one player attack damage by 50
    // Increase evasion by 2
    func sliceDice(target: [Player]) {
        
    }
    //  TOUGH SKIN:
    //  Increase min and max block range by 100
    //  Heal for 100 flat
    //  Increase evasion by 1 for 2 turns
    func toughSkin() {
        
    }
    
    // King's abilities
    //  EMPOWER:
    //  Empower all enemies on the battle field
    //  Increase all their stats by flat amount: Speed + 2, Evasion + 1, min-max damage + 50, min-max block + 50
    // NOTE: CANNOT USE FOR THE NEXT TURN
    func empower() {
        
    }
    
    // COMMAND:
    // Command an enemy to hit a random player
    func command(target: Player, minion: Enemy) {
        
    }
    
}
