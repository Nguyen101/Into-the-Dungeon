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
    }
    
    @IBAction func createGameButton(_ sender: Any) {
        
    
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
        
        FirebaseUtils.getUsers(gameID: gameID, completion: {(users) in
            print("adding user to list...")
            if users.contains(userName) {
                print("user already in game...")
            }else{
                var userList = users
                userList.append(userName)
                print(userList)
                FirebaseUtils.setUsers(gameID: self.gameID, users: userList)
            }
        })
    }
    
    /*
     checks to seee if the text fields have valid inputs
     */
    func isValidInput() -> Bool {
        guard let gameId = gameIDTextField.text, let userName = userNameTextField.text else {
            
            return false
        }
        
        if gameId == "" || userName == "" {
            return false
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if !isValidInput() {
                alertUser(title: "Wrong input", message: "please provide valid inputs for the game id and the username")
                return
            }
            if identifier == "joinGameSegue" {
                //todo make sure that the game id is in the database
                
                
                addPlayerToGame(isInCharge: false)
                
                if let vc = segue.destination as? CharacterSelectionController {
                    vc.gameID = gameID
                    vc.userName = userName
                }
                
                testFirebase()
                
            }else if identifier == "createGameSegue" {
                
                var users: [String] = []
                
                if let name = userNameTextField.text {
                    users.append(name)
                }
                
                let data = [
                    "users": users
                ]
                
                FirebaseUtils.setGameData(gameID: gameIDTextField.text!, gameData: data)
                
                addPlayerToGame(isInCharge: true)
                
                if let vc = segue.destination as? CharacterSelectionController {
                    vc.gameID = gameID
                    vc.userName = userName
                }
            }
            
        }
        
    }
    
    func testFirebase() {
        FirebaseUtils.getGameData(gameID: gameID, completion: {(data) in
            print("TEST 1")
            if let gameData = data as? NSDictionary{
                print("TEST 2")
                if let users = gameData["users"] as? [String] {
                    print(users)
                }
                if let user = gameData[self.userName] as? NSDictionary {
                    print("TEST 3")
                    if let name = user["name"] as? String {
                        print("TEST " + name)
                    }
                }
            }
        })
    }
}
