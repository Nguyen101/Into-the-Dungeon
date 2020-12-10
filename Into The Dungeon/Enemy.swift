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
        case .archer:
            enemyImage = SKTexture(imageNamed: "enemy_archer")
            self.HP = 300
            self.Speed = 2
            self.evasion = 1
        case .doctor:
            enemyImage = SKTexture(imageNamed: "enemy_doctor")
            self.HP = 300
            self.Speed = 2
            self.evasion = 1
        case .mage:
            enemyImage = SKTexture(imageNamed: "enemy_mage")
            self.HP = 250
            self.Speed = 2
            self.evasion = 1
        case .greatLancer:
            enemyImage = SKTexture(imageNamed: "enemy_great_lancer")
            self.HP = 800
            self.Speed = 2
            self.evasion = 1
        case .theExecutor:
            enemyImage = SKTexture(imageNamed: "enemy_the_executor")
            self.HP = 750
            self.Speed = 2
            self.evasion = 1
        case .corruptKing:
            enemyImage = SKTexture(imageNamed: "enemy_corrupt_king")
            self.HP = 1000
            self.Speed = 2
            self.evasion = 1
        }
        super.init(texture: enemyImage, color: .clear, size: enemyImage.size())
    }
    // -MARK:regular enemies skill
    
    // guard abilities
    func slash(target: SKSpriteNode) {
        
    }
    func shield() {
        
    }
    
    // archer abilities
    func shoot() {
        
    }
    func block() {
        
    }
    // doctor abilities
    func heal() {
        
    }
    
    func smokeScreen() {
        
    }
    // mage abilities
    func fireBall() {
        
    }
    
    func iceShield() {
        
    }
    // greae lancer ability
    func charge() {
        
    }
    
    func withStand() {
        
    }
    // the executor ability
    func sliceDice() {
        
    }
    
    func toughSkin() {
        
    }
    // King abilities
    func empower() {
        
    }
    func command() {
        
    }
    
    func summon() {
        
    }
}
