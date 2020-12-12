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
    var initializedObserver: Bool = false;

    
    override func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "dog")
        topArrow = SKSpriteNode(imageNamed: "104415")
        bottomArrow = SKSpriteNode(imageNamed: "104415")
        leftArrow = SKSpriteNode(imageNamed: "104415")
        rightArrow = SKSpriteNode(imageNamed: "104415")
        
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.zPosition = -1
        addChild(background)
        
        
        topArrow.name = "topArrow"
        topArrow.size = CGSize(width: topArrow.size.width/8, height: topArrow.size.height/8)
        topArrow.position = CGPoint(x: 0, y: 600)
        print(self.frame.width)
        print(self.frame.height)
        addChild(topArrow)
        
        bottomArrow.name = "bottomArrow"
        bottomArrow.size = CGSize(width: bottomArrow.size.width/8, height: bottomArrow.size.height/8)
        bottomArrow.position = CGPoint(x: 0, y: -600)
        addChild(bottomArrow)
        
        leftArrow.name = "leftArrow"
        leftArrow.size = CGSize(width: leftArrow.size.width/8, height: leftArrow.size.height/8)
        leftArrow.position = CGPoint(x: -300, y: 0)
        addChild(leftArrow)
        
        rightArrow.name = "rightArrow"
        rightArrow.size = CGSize(width: rightArrow.size.width/8, height: rightArrow.size.height/8)
        rightArrow.position = CGPoint(x: 300, y: 0)
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
        
        if(!initializedObserver){
            initializeRoomObserver()
            initializedObserver = true
        }
        
        if frontTouchedNode == topArrow.name! {
            print("Top Arrow Touched")
        }else if(frontTouchedNode == bottomArrow.name!){
            print("Bottom Arrow Touched " + FirstScreenViewController.userName)
            FirebaseUtils.getIsUserInCharge(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName) { (data) in
                print(data)
                if(data){
                    print("TEST")
                    FirebaseUtils.setDungeonRomm(gameID: FirstScreenViewController.gameID, room: "battle scene")
                }
            }
        }else if(frontTouchedNode == leftArrow.name!){
            print("Left Arrow Touched")
            FirebaseUtils.getIsUserInCharge(gameID: FirstScreenViewController.gameID, userName: FirstScreenViewController.userName) { (data) in
                if(data){
                    FirebaseUtils.setDungeonRomm(gameID: FirstScreenViewController.gameID, room: "shop scene")
                }
            }
        }else if(frontTouchedNode == rightArrow.name!){
            print("Right Arrow Touched")
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
                    rootVC.performSegue(withIdentifier: "BattleSceneSegue", sender: nil)
                }else if data == "shop scene" {
                    rootVC.performSegue(withIdentifier: "ShopSceneSegue", sender: nil)
                }else if data == "mini boss scene" {
                    rootVC.performSegue(withIdentifier: "MiniBossSceneSegue", sender: nil)
                }
            }
        }
    }
}
