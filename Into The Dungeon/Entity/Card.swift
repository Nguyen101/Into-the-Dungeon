//
//  Card.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation

class Card {
    var characterClass: String
    init(characterClass: String) {
        self.characterClass = characterClass
        // Base deck creation
        if (characterClass == "Warrior") {
            // 5 attacks
            // 5 defend
            // 2 special
        } else if (characterClass == "Archer") {
            // 5 attacks
            // 5 defend
            // 2 special
        } else if (characterClass == "Cleric") {
            // 5 attacks
            // 5 defend
            // 2 special
        } else if (characterClass == "Mage") {
            // 5 attacks
            // 5 defend
            // 2 special
        }
    }
}

