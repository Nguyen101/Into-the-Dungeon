//
//  GameScene.swift
//  Into The Dungeon
//
//  Created by Vy Nguyen on 11/23/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene {
    
    var background  = SKSpriteNode()
    var topArrow = SKSpriteNode()
    var bottomArrow = SKSpriteNode()
    var leftArrow = SKSpriteNode()
    var rightArrow = SKSpriteNode()
    var battleRoomTwo = SKSpriteNode()
    static var initializedObserver: Bool = false;

    
    override func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "Zoriy User Profile | DeviantArt")
        topArrow = SKSpriteNode(imageNamed: "3153859")
        bottomArrow = SKSpriteNode(imageNamed: "1469810")
        leftArrow = SKSpriteNode(imageNamed: "509802")
        rightArrow = SKSpriteNode(imageNamed: "2614419")
        battleRoomTwo = SKSpriteNode(imageNamed: "1469810")
        
//        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.zPosition = -1
        addChild(background)
        
        
        topArrow.name = "topArrow"
        topArrow.size = CGSize(width: topArrow.size.width/8, height: topArrow.size.height/8)
        topArrow.position = CGPoint(x: 0, y: 100)
        print(self.frame.width)
        print(self.frame.height)
        addChild(topArrow)
        
        bottomArrow.name = "bottomArrow"
        bottomArrow.size = CGSize(width: bottomArrow.size.width/8, height: bottomArrow.size.height/8)
        bottomArrow.position = CGPoint(x: -50, y: -100)
        addChild(bottomArrow)
        
        battleRoomTwo.name = "battleRoomTwo"
        battleRoomTwo.size = CGSize(width: battleRoomTwo.size.width/8, height: battleRoomTwo.size.height/8)
        battleRoomTwo.position = CGPoint(x: 50, y: -100)
        addChild(battleRoomTwo)
        
        leftArrow.name = "leftArrow"
        leftArrow.size = CGSize(width: leftArrow.size.width/8, height: leftArrow.size.height/8)
        leftArrow.position = CGPoint(x: -200, y: 0)
        addChild(leftArrow)
        
        rightArrow.name = "rightArrow"
        rightArrow.size = CGSize(width: rightArrow.size.width/8, height: rightArrow.size.height/8)
        rightArrow.position = CGPoint(x: 200, y: 0)
        addChild(rightArrow)
        
    }
    
    override func sceneDidLoad() {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: self)
        
        let frontTouchedNode = atPoint(location).name
        
        if(!GameScene.initializedObserver){
            initializeRoomObserver()
            GameScene.initializedObserver = true
        }
        
        if frontTouchedNode == topArrow.name! {
            print("Top Arrow Touched")
        }else if (frontTouchedNode == battleRoomTwo.name!){
            FirebaseUtils.getIsUserInCharge(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName) { (data) in
                if(data){
                    FirebaseUtils.setDungeonRomm(gameID: FirstScreenViewController.gameID, room: "battleRoomTwo")
                }
            }
        }else if(frontTouchedNode == bottomArrow.name!){
            FirebaseUtils.getIsUserInCharge(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName) { (data) in
                if(data){
                    FirebaseUtils.setDungeonRomm(gameID: FirstScreenViewController.gameID, room: "battle scene")
                }
            }
        }else if(frontTouchedNode == leftArrow.name!){
            FirebaseUtils.getIsUserInCharge(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName) { (data) in
                if(data){
                    FirebaseUtils.setDungeonRomm(gameID: FirstScreenViewController.gameID, room: "shop scene")
                }
            }
        }else if(frontTouchedNode == rightArrow.name!){
            FirebaseUtils.getIsUserInCharge(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName) { (data) in
                if(data){
                    FirebaseUtils.setDungeonRomm(gameID: FirstScreenViewController.gameID, room: "mini boss scene")
                }
            }
        }else{
            print("background touched")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func initializeRoomObserver(){
        if let view = self.view, let window = view.window, let rootVC = window.rootViewController {
            print("observer test")
            FirebaseUtils.observeDungeonRoom(gameID: FirstScreenViewController.gameID) { (data) in
                print(data)
                if data == "battle scene" {
                    BattleScene.battleRoom = 0
                    rootVC.performSegue(withIdentifier: "BattleSceneSegue", sender: nil)
                }else if data == "shop scene" {
                    rootVC.performSegue(withIdentifier: "ShopSceneSegue", sender: nil)
                }else if data == "mini boss scene" {
                    rootVC.performSegue(withIdentifier: "MiniBossSceneSegue", sender: nil)
                }else if data == "battleRoomTwo" {
                    BattleScene.battleRoom = 1
                    rootVC.performSegue(withIdentifier: "BattleSceneSegue", sender: nil)
                }
            }
        }
    }
}
