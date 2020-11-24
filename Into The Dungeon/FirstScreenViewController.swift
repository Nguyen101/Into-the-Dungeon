//
//  FirstScreenViewController.swift
//  Into The Dungeon
//
//  Created by Latham, Nicholas De Artola on 11/23/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//
import UIKit
import FirebaseDatabase
import Firebase

class FirstScreenViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    //these two variables are what we are goingg to be pasing around the game
    var userName: String = ""
    var gameID: String = ""
    
    @IBOutlet weak var gameIDTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBAction func joinGameButton(_ sender: Any) {
        //todo make sure that the game id is in the database
        
        addPlayerToGame(isInCharge: false)
    }
    
    @IBAction func createGameButton(_ sender: Any) {
        addPlayerToGame(isInCharge: true)
    
    }
    
    override func viewDidLoad() {
        ref = Database.database().reference()
        
        
    }
    
    func addPlayerToGame(isInCharge: Bool) {
        guard let gameId = gameIDTextField.text, let userName = userNameTextField.text else {
            
            alertUser(title: "Wrong input", message: "please provide valid inputs for the game id and the username")
            
            return
        }
        
        self.userName = userName
        self.gameID = gameId
            
        let data = [
            "name": userName,
            "inCharge": isInCharge,
            "class": "none",
            "hitpoints": 12
        ] as [String : Any]
            
        FirebaseUtils.setUserData(gameID: gameID, userName: userName, userData: data)
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
}
