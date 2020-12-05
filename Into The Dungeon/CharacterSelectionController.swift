//
//  CharacterSelectionController.swift
//  Into The Dungeon
//
//  Created by Nguyen, Vy Luong on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit
import GameplayKit
import FirebaseDatabase
import Firebase

class CharacterSelectionController: UIViewController {

    
    var gameID: String? = nil
    var userName: String? = nil //nae of the user so that we can identify it out of the list of players
    var classChosen: String? = nil
    
    @IBOutlet weak var classChosenLabel: UILabel!
    
    @IBAction func ClericButton(_ sender: Any) {
        classChosenLabel.text = "Class Chosen: Cleric"
        classChosen = "Cleric"
    }
    
    @IBAction func ArcherButton(_ sender: Any) {
        classChosenLabel.text = "Class Chosen: Archer"
        classChosen = "Archer"
    }
    
    @IBAction func MageButton(_ sender: Any) {
        classChosenLabel.text = "Class Chosen: Mage"
        classChosen = "Mage"
    }
    
    @IBAction func WarriorButton(_ sender: Any) {
        classChosenLabel.text = "Class Chosen: Warrior"
        classChosen = "Warrior"
    }
    
    @IBAction func goToGameButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
//        if let scene = GKScene(fileNamed: "CharacterSelectionScene") {
//
//            // Get the SKScene from the loaded GKScene
//            if let sceneNode = scene.rootNode as! GameScene? {
//
//                // Copy gameplay related content over to the scene
//                sceneNode.entities = scene.entities
//                sceneNode.graphs = scene.graphs
//
//                // Set the scale mode to scale to fit the window
//                sceneNode.scaleMode = .aspectFill
//
//                // Present the scene
//                if let view = self.view as! SKView? {
//                    view.presentScene(sceneNode)
//
//                    view.ignoresSiblingOrder = true
//
//                    view.showsFPS = true
//                    view.showsNodeCount = true
//                }
//            }
//        }
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
    
    /*
     alerts the user
     
     parameters: title: a string which is the title
                 message: a string which is the message
     */
    func alertUser(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle:  .alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) -> Void in
        }))
        
        present(alertController, animated: true, completion: { () -> Void in
        })
    }
    
    func isValidInput() -> Bool{
        if classChosen == nil {
            return false
        }else{
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if !isValidInput() {
                alertUser(title: "Wrong input", message: "please select a class")
                return
            }
            if identifier == "ContinueToGameSegue" {
                //todo make sure that the game id is in the database
                if let className = classChosen, let id = gameID, let name = userName {
                    var cards: [String] = getInitialInitialCardsForPlayer(className: className)
                    FirebaseUtils.setClassForUser(gameID: id, userName: name, className: className)
                    FirebaseUtils.setCardsforUser(gameID: id, userName: name, cards: cards)
                }
                
            }
            
        }
        
    }
    
    func getInitialInitialCardsForPlayer(className: String) -> [String] {
        var cards: [String] = []
        
        if className == "Cleric" {
            cards.append("card_cleric_headbash")
            cards.append("card_cleric_shield")
            cards.append("card_cleric_basicHeal")
            cards.append("card_cleric_divineHeal")
            cards.append("card_cleric_haste")
            cards.append("card_cleric_pray")
        }else if className == "Mage" {
            cards.append("card_mage_fireblast")
            cards.append("card_mage_iceBarrier")
            cards.append("card_mage_shiningLight")
            cards.append("card_mage_darkCloud")
            cards.append("card_mage_unbreakableBarrier")
            cards.append("card_mage_lightningStrike")
            cards.append("card_mage_amplify")
            cards.append("card_mage_chaosWind")
        }else if className == "Archer" {
            cards.append("card_archer_shoot")
            cards.append("card_archer_block")
            cards.append("card_archer_hellfire")
            cards.append("card_archer_marked")
            cards.append("card_archer_bulleyes")
            cards.append("card_archer_suppressfire")
            cards.append("card_archer_quickdraw")
            cards.append("card_archer_blindshot")
            cards.append("card_archer_godswill")
            cards.append("card_archer_revive")
        }else if className == "Warrior" {
            cards.append("card_warrior_slash")
            cards.append("card_warrior_guard")
            cards.append("card_warrior_moraleBoost")
            cards.append("card_warrior_rage")
            cards.append("card_warrior_execute")
            cards.append("card_warrior_uppercut")
            cards.append("card_warrior_sharpenblade")
            cards.append("card_warrior_doubleEdgeSword")
        }
        return cards
    }
}
