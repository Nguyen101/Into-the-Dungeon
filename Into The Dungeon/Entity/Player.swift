//
//  Warrior.swift
//  Into The Dungeon
//
//  Created by Vy Nguyen on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit

// use for character creation
class Player {
    var characterClass: Any
    var name: String
    init (team: Team, characterClass: String, name: String) {
        self.name = name
        // a bunch of if statements for the character class
        if(characterClass == "Warrior" ) {
            self.characterClass = Warrior(imageName: "Warrior.png", team: .team1)
        } else if (characterClass == "Archer" ) {
            self.characterClass = Archer(imageName: "Archer.png", team: .team1)
        } else if (characterClass == "Cleric" ) {
            self.characterClass  = Cleric(imageName: "Cleric.png", team: .team1)
        } else {
            self.characterClass  = Mage(imageName: "Mage.png", team: .team1)
        }
    }
    
}
