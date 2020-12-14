//
//  CampScene.swift
//  Into The Dungeon
//
//  Created by Latham, Nicholas De Artola on 11/29/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit

class MiniBoss: SKScene {

    var players: [Player] = []
    var cards: [Card] = []
    var enemies: [Enemy] = []
    
    var selectedCard: Card? = nil
    var selectedEnemy: Enemy? = nil
        
    var playerNames: [String] = []
    var turn: Int = 0
    var playerIndex: Int = 0 //index of the player
    
    var background  = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        observeGameData()
        addEnemyNodes()
        
        background = SKSpriteNode(imageNamed: "Flooded Catacombs by Celarx on DeviantArt")
//        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.zPosition = -1
        addChild(background)
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
                    
                    
                    if let playerName = player["name"] as? String {
                        tempPlayer!.name = playerName
                        if playerName == FirstScreenViewController.userName {
                            self.playerIndex = counter
                        }
                    }
                    
                    if let hitPoints = player["hitpoints"] as? Int {
                        tempPlayer?.currentHP = hitPoints
                        tempPlayer?.HPLabel.text = (tempPlayer?.name!)! + " " + String(hitPoints)
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
                
                for en in self.enemies {
                    if let enemyHP = enemies[en.name!] as? Int {
                        en.currentHP = enemyHP
                        en.HPLabel.text = en.name! + " " + String(enemyHP)
                        if enemyHP <= 0 {
                            en.texture = SKTexture(imageNamed: "2868354")
                        }
                        print(en.name! + " " + String(en.currentHP))
                    }
                }
            }
            
            self.checkForEndOfGame()
            
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
            x.size = CGSize(width: x.size.width/6, height: x.size.height/6)
            x.position = CGPoint(x: i*100 - 300, y: +120)
            i += 1
            addChild(x)
        }
    }
    
    func addEnemyNodes(){
        print("ADDING ENEMY NODES")
        let randomInt = Int.random(in: 1..<2)
        if randomInt == 1 {
            enemies.append(Enemy(enemyType: .theExecutor))
            self.enemies[0].name = "enemy_the_executor"
        } else {
            enemies.append(Enemy(enemyType: .greatLancer))
            self.enemies[0].name = "enemy_great_lancer"
        }
    
        var i = 0
        for x in enemies {
            x.size = CGSize(width: x.size.width/6, height: x.size.height/6)
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
        
        checkForEndOfGame()
    }
    
    /*
     checks for the end of the game and if it is the end then goes to end of game segue
     */
    func checkForEndOfGame(){
        if isEndOfGame() {
            if let view = self.view, let window = view.window, let rootVC = window.rootViewController {
                rootVC.performSegue(withIdentifier: "GameEndSegue", sender: nil)
            }
        }
    }
    
    /*
     checks to see if it should be the end of the game
     */
    func isEndOfGame() -> Bool {
        for x in enemies {
            if x.currentHP > 0 {
                return false
            }
        }
        return true
    }
    
    /*
     safely deletes a card
     */
    func deleteCard(index: Int){
        cards[index].removeFromParent()
        cards.remove(at: index)
    }
    
    /*
     updates the database - make sure to only call this at the end of a turn since we dont want to make a ton of calls from the database
     */
    func updateDataInDatabase(){
        for x in players {
            FirebaseUtils.setHitPointsForUser(gameID: FirstScreenViewController.gameID, userName: x.name!, hitPoints: x.currentHP)
        }
        
        for en in enemies {
            FirebaseUtils.setEnemyHitPoints(gameID: FirstScreenViewController.gameID, enemyName: en.name!, hitPoints: en.currentHP)
        }
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
        if isCurrentPlayersTurn() {
            if let touchedNode = frontTouchedNode {
                
                if Card.wasItACardClicked(nodename: touchedNode) {
                    //a card was touched
                    let cardType = Card.getCardType(cardName: touchedNode)
                    print("card clicked")
                    
                    selectedCard = Card(cardType: cardType)

                }
                if Enemy.wasItAnEnemyClicked(nodeName: touchedNode){
                    print("enemy clicked")
                    if let card = selectedCard {
                        for x in enemies {
                            if touchedNode == x.name {
                                switch card.cardType {
                                case .slash,
                                     .shoot,
                                     .marked,
                                     .headBash,
                                     .fireBlast:
                                    players[playerIndex].attack(cardPlayed: card, target: x)
                                case .rage,
                                     .hellFire,
                                     .divineHeal,
                                     .darkCloud:
                                    players[playerIndex].specialAbility(cardPlayed: card, targets: enemies, targetNum: 0, currTeam: players, buffTarget: players[playerIndex])
                                default:
                                    print("uknown action")
                                }
                            }
                        }
                        selectedCard = nil
                        nextPlayersTurn()
                    }
                }
                if playerNames.contains(touchedNode){
                    let selectedIndex = getIndexOfSelectedPlayer(playerName: touchedNode)
                    print("ally or yourself clicked")
                    if let card = selectedCard {
                        switch card.cardType {
                        case .guarD,
                             .moraleBoost,
                             .block,
                             .shield,
                             .basicHeal,
                             .iceBarrier,
                             .divineLight:
                                players[selectedIndex].defend(cardPlayed: card)
                        case .rage,
                             .hellFire,
                             .divineHeal,
                             .darkCloud:
                            players[selectedIndex].specialAbility(cardPlayed: card, targets: enemies, targetNum: 0, currTeam: players, buffTarget: players[selectedIndex])
                        default:
                            print("uknown action")
                        }
                        selectedCard = nil
                        nextPlayersTurn()
                    }
                }
            }
        }
    }
    
    func getIndexOfSelectedPlayer(playerName: String) -> Int{
        var i = 0
        for x in players {
            if x.name == playerName {
                return i
            }
            i += 1
        }
        return 0
    }


}

