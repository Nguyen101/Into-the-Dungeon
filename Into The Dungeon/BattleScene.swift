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
    
    var players: [Player] = []
        
    var playerNames: [String] = []
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
            self.playerNames = players
            
            guard let turn = data["turn"] as? Int else {
                print("couldnt get turn")
                return
            }
            self.turn = turn
            
            self.deleteAllPlayerNodes()
            
            for x in players {
                if let player = data[x] as? NSDictionary {
                    
                    if let className = player["class"] as? String {
                        if className == "Cleric" {
                            self.players.append(Player(playerType: .cleric))
                        }else if className == "Mage" {
                            self.players.append(Player(playerType: .mage))
                        }else if className == "Archer" {
                            self.players.append(Player(playerType: .archer))
                        }else if className == "Warrior" {
                            self.players.append(Player(playerType: .warrior))
                        }
                    }
                    
                    self.addPlayerNodes()
                    
                    if let cards = player["cards"] as? String {
                        
                    }
                    
                    
                }
            }
            
            
            
        }
    }
    
    func addPlayerNodes(){
        var i = 0
        for x in players {
            x.name = playerNames[i]
            x.size = CGSize(width: x.size.width/8, height: x.size.height/8)
            x.position = CGPoint(x: 0, y: i*10)
            i += 1
            addChild(x)
        }
    }
    
    /*
     deletes all the nodes
     */
    func deleteAllPlayerNodes(){
        for x in self.players {
            x.removeFromParent()
        }
        self.players = []
    }
    
    /*
     sets the turn to be the next players
     */
    func nextPlayersTurn(){
        updatePlayerInDatabase()
        turn = (turn + 1) % playerNames.count
        FirebaseUtils.setPlayerTurn(gameID: FirstScreenViewController.gameID, turn: turn)
    }
    
    /*
     updates the player in the database
     */
    func updatePlayerInDatabase(){
        
    }
    
    /*
     checks to see if it is the current players turn
     */
    func isCurrentPlayersTurn() -> Bool{
        if turn < playerNames.count {
            if playerNames[turn] == FirstScreenViewController.userName {
                return true
            }
        }
        return false
    }

}

