//
//  BattleScene.swift
//  Into The Dungeon
//
//  Created by Latham, Nicholas De Artola on 11/29/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit

class BattleScene: SKScene {
    

    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var players: [String] = []
    var turn: Int = 0
    
//    var entityManager: EntityManager! // user to remove or add an entity
    
    
    override func didMove(to view: SKView) {
        
    }
    
    override func sceneDidLoad() {

    }
    
    func observeGameData(){
        FirebaseUtils.observeGameData(gameID: FirstScreenViewController.gameID) { (data) in
            guard let players = data["users"] as? [String] else {
                print("couldn't get players")
                return
            }
            self.players = players
            
            guard let turn = data["turn"] as? Int else {
                print("couldnt get turn")
                return
            }
            self.turn = turn
            
            for x in players {
                if let player = data[x] as? NSDictionary {
                    
                    if let cards = player["cards"] as? String {
                        
                    }
                    
                    
                }
            }
            
        }
    }
    
    /*
     sets the turn to be the next players
     */
    func nextPlayersTurn(){
        turn = (turn + 1) % players.count
        FirebaseUtils.setPlayerTurn(gameID: FirstScreenViewController.gameID, turn: turn)
    }
    
    /*
     checks to see if it is the current players turn
     */
    func isCurrentPlayersTurn() -> Bool{
        if turn < players.count {
            if players[turn] == FirstScreenViewController.userName {
                return true
            }
        }
        return false
    }

}

