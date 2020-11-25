//
//  TeamComponent.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//
import SpriteKit
import GameplayKit


// team 1 = human, team2=  AI
// this is use to determine players turn
enum Team:Int {
    case team1 = 1
    case team2 = 2
    static let allValues = [team1, team2]
    
    func  oppositeTeam() -> Team {
        switch self {
        case .team1:
            return .team2
        case .team2:
            return .team1
        }
    }
}

class TeamComponent: GKComponent {
    let team: Team
    init(team: Team) {
        self.team = team
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
