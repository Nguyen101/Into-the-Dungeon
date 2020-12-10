//
//  CampViewController.swift
//  Into The Dungeon
//
//  Created by Latham, Nicholas De Artola on 11/29/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit
import GameplayKit
import FirebaseDatabase
import Firebase

class CampViewController: UIViewController {

    
    var gameID: String? = nil
    var userName: String? = nil //nae of the user so that we can identify it out of the list of players
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
