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
    var cards: [Card] = []
    var enemies: [Enemy] = []
        
    var playerNames: [String] = []
    var turn: Int = 0
    var playerIndex: Int = 0 //index of the player
    
//    var entityManager: EntityManager! // user to remove or add an entity
    
    
    override func didMove(to view: SKView) {
        observeGameData()
        addEnemyNodes()
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
            self.deleteCardNodes()
            
            var counter = 0
            for x in players {
                if let player = data[x] as? NSDictionary {
                    
                    if let playerName = player["name"] as? String {
                        if playerName == FirstScreenViewController.userName {
                            self.playerIndex = counter
                        }
                    }
                    
                    var tempPlayer: Player? = nil
                    
                    if let className = player["class"] as? String {
                        if className == "Cleric" {
                            tempPlayer = Player(playerType: .cleric)
                        }else if className == "Mage" {
                            tempPlayer = Player(playerType: .mage)
                        }else if className == "Archer" {
                            tempPlayer = Player(playerType: .archer)
                        }else {
                            tempPlayer = Player(playerType: .warrior)
                        }
                    }
                    
                    if let hitPoints = player["hitpoints"] as? Int {
                        tempPlayer?.HP = hitPoints
                    }
                    
                    if let cards = player["cards"] as? [String] {
                        for x in cards {
                            let type = Card.getCardType(cardName: x)
                            tempPlayer?.currentDeck.append(Card(cardType: type))
                            
                            //if this is the player then add the card nodes
                            if let playerName = player["name"] as? String {
                                if playerName == FirstScreenViewController.userName {
                                    self.cards.append(Card(cardType: type))
                                }
                            }
                            
                        }
                    }
                    self.players.append(tempPlayer!)
                    counter += 1
                }
            }
            self.addPlayerNodes()
            self.addCardNodes()
            
            if let enemies = data["enemies"] as? NSDictionary {
                if let archerHP = enemies["enemy_archer"] as? Int {
                    self.enemies[0].HP = archerHP
                }
                if let guardHP = data["enemy_guard"] as? Int {
                    self.enemies[1].HP = guardHP
                }
            }
            
        }
    }
    
    func deleteCardNodes(){
        for x in self.cards {
            x.removeFromParent()
        }
        self.cards = []
    }
    
    func addCardNodes() {
        print("ADDING CARD NODES")
        var i = 0
        for x in cards {
            x.size = CGSize(width: x.size.width/7, height: x.size.height/6)
            x.position = CGPoint(x: i*100 - 100, y: -30)
            i += 1
            addChild(x)
        }
    }
    
    func addPlayerNodes(){
        print("ADDING NODES")
        
        var i = 0
        for x in players {
            print("adding " + playerNames[i])
            x.name = playerNames[i]
            x.size = CGSize(width: x.size.width/4, height: x.size.height/4)
            x.position = CGPoint(x: i*100 - 300, y: +120)
            i += 1
            addChild(x)
        }
    }
    
    func addEnemyNodes(){
        print("ADDING ENEMY NODES")
        
        enemies.append(Enemy(enemyType: .archer))
        enemies.append(Enemy(enemyType: .guarD))
        self.enemies[0].name = "enemy_archer"
        self.enemies[1].name = "enemy_guard"
    
        var i = 0
        for x in enemies {
            x.size = CGSize(width: x.size.width/4, height: x.size.height/4)
            x.position = CGPoint(x: i*100 + 100, y: +120)
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
        updateDataInDatabase()
        turn = (turn + 1) % playerNames.count
        FirebaseUtils.setPlayerTurn(gameID: FirstScreenViewController.gameID, turn: turn)
    }
    
    /*
     updates the database - make sure to only call this at the end of a turn since we dont want to make a ton of calls from the database
     */
    func updateDataInDatabase(){
        FirebaseUtils.setHitPointsForUser(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName, hitPoints: players[playerIndex].HP)
        FirebaseUtils.setEnemyHitPoints(gameID: FirstScreenViewController.gameID, enemyName: "enemy_archer", hitPoints: enemies[0].HP)
        FirebaseUtils.setEnemyHitPoints(gameID: FirstScreenViewController.gameID, enemyName: "enemy_guard", hitPoints: enemies[1].HP)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: self)
        
        let frontTouchedNode = atPoint(location).name
        if let touchedNode = frontTouchedNode {
            
            if Card.wasItACardClicked(nodename: touchedNode) {
                //a card was touched
                var cardType = Card.getCardType(cardName: touchedNode)
                print("card clicked")
                
                
            }
            if Enemy.wasItAnEnemyClicked(nodeName: touchedNode){
                print("enemy clicked")
            }
            
        }
    }

}

