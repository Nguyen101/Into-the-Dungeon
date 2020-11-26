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

    var ref: DatabaseReference!
    
    var gameID: String? = nil
    var userName: String? = nil //nae of the user so that we can identify it out of the list of players
    var players: [Player] = [] //list of players
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FirebaseApp.configure()

        ref = Database.database().reference()
        
        self.ref.child("games").setValue(1324)
        
        self.ref.child("games").observeSingleEvent(of: .value, with: { (sanpshot) in
            if let id = sanpshot.value as? Int {
                print("thh value from the database: \(id)")
            }
        })
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }
    
    func updatePlayers() {
        if let id = gameId, let user = userName {
            FirebaseUtils.getGameData(gameID: id, completion: {(data) in
                if let userList = data["users"] as? [String] {
                    for x in userList {
                        if let userData = data[x] {
                            players.append(Player(team: .team1, characterClass: userData["class"], name: userData["name"])
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
