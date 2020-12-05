//
//  GameEndViewController.swift
//  Into The Dungeon
//
//  Created by Latham, Nicholas De Artola on 11/29/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation

import UIKit

class GameEndViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.all)
    }
}
