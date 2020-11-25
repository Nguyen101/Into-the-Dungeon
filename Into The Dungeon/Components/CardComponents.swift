//
//  Card.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation

// pretty self-explanatory and just needed to add a draw deck and a discard deck entity
class CardComponents {
    var cardManaCost: Int
    var cardDescription: String
    var cardImage: String
    var characterClass: String
    init(cardManaCost: Int, cardDescription: String, cardImage: String, characterClass: String) {
        self.cardManaCost = cardManaCost
        self.cardDescription = cardDescription
        self.cardImage = cardImage
        self.characterClass = characterClass
    }
}

