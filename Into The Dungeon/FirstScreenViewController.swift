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
    var userName: String = ""
    var gameID: String = ""
    
    @IBOutlet weak var gameIDTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBAction func joinGameButton(_ sender: Any) {
        addPlayerToGame(isInCharge: false)
    }
    
    @IBAction func createGameButton(_ sender: Any) {
        addPlayerToGame(isInCharge: true)
        
        print("create game button pressed")
        self.ref.child("games").child(gameID).child(userName).child("name").observeSingleEvent(of: .value, with: { (sanpshot) in
            if let id = sanpshot.value as? String {
                print("thh value from the database: \(id)")
            }
        })
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
            
        self.ref.child("games").child(gameId).child(userName).setValue(data)
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
