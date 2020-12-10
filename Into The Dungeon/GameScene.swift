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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: self)
        
        let touchedNodes = nodes(at: location)
        let frontTouchedNode = atPoint(location).name
        
        if frontTouchedNode == topArrow.name! {
            print("Top Arrow Touched")
        }else if(frontTouchedNode == bottomArrow.name!){
            print("Bottom Arrow Touched")
            if let view = self.view, let window = view.window, let rootVC = window.rootViewController {
                rootVC.performSegue(withIdentifier: "BattleSceneSegue", sender: nil)
            }
            
        }else if(frontTouchedNode == leftArrow.name!){
            print("Left Arrow Touched")
        }else if(frontTouchedNode == rightArrow.name!){
            print("Right Arrow Touched")
        }else{
            print("background touched")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
