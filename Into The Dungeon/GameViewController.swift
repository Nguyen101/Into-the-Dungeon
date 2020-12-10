//
//  GameViewController.swift
//  Into The Dungeon
//
//  Created by Vy Nguyen on 11/23/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import FirebaseDatabase
import Firebase

class GameViewController: UIViewController {

    
    var gameID: String? = nil
    var userName: String? = nil //nae of the user so that we can identify it out of the list of players
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TEST 1")
        
        if let view = self.view as! SKView? {
            print("TEST 2 ")
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                print("TEST 3")
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func updatePlayers() {
        if let id = gameID, let user = userName {
            FirebaseUtils.getGameData(gameID: id, completion: {(data) in
                if let gameData = data as? NSDictionary{
                    if let userList = gameData["users"] as? [String] {
                        for x in userList {
                            if let userData = gameData[x] as? NSDictionary {
                                //self.players.append(Player(team: .team1, characterClass: userData["class"] as! String, name: userData["name"] as! String))
                            }
                        }
                    }
                }
            })
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
