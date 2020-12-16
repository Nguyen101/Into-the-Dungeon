//
//  FirebaseUtils.swift
//  Into The Dungeon
//
//  Created by Latham, Nicholas De Artola on 11/24/20.
//  Copyright © 2020 Vy Nguyen. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class FirebaseUtils {
    static var ref: DatabaseReference! =  Database.database().reference()
    
    init(){
        
    }
    
    /*
     gets the game data from firebase
     takes in the game id and a closure
     */
    static func getGameData(gameID: String, completion: @escaping (Any?) -> Void) {
        var gameData: Any? = nil
        self.ref.child("games").child(gameID).observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value {
                gameData = data
                DispatchQueue.main.async{
                    completion(gameData)
                }
            }
        })
        
    }
    
    /*
     observes the game data and the closure gets called whenever a value changes
     takes in a game id and a closure
     */
    static func observeGameData(gameID: String, completion: @escaping (NSDictionary) -> Void) {
        self.ref.child("games").child(gameID).observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                DispatchQueue.main.async{
                    completion(data)
                }
            }
        }
    }
    
    /*
     sets the game data in the database
     takes in the game data and the game id
     */
    static func setGameData(gameID: String, gameData: Any){
        self.ref.child("games").child(gameID).setValue(gameData)
    }
    
    /*
     gets the user data from the data base
     */
    static func getUserData(gameID: String, userName: String, completion: @escaping (Any?) -> Void) -> Void{
        var userData: Any? = nil
        
        self.ref.child("games").child(gameID).child(userName).observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value {
                userData = data
                DispatchQueue.main.async {
                    completion(userData)
                }
            }
        })
    }
    
    /*
     sets the user data 
     */
    static func setUserData(gameID: String, userName: String, userData: Any){
        self.ref.child("games").child(gameID).child(userName).setValue(userData)
    }
    
    static func getUserName(gameID: String, userName: String, completion: @escaping (String?) -> Void) {
        var name: String? = nil
        
        self.ref.child("games").child(gameID).child(userName).child("name").observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value as? String {
                print("test: " + data)
                name = data
                DispatchQueue.main.async {
                    completion(name)
                }
            }
        })
    }
    
    /*
     returns a list of the players in the game
     */
    static func getUsers(gameID: String, completion: @escaping ([String]) -> Void){
        self.ref.child("games").child(gameID).child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let data = snapshot.value as? [String] {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        })
    }
    
    /*
     sets the list of users in the game
     */
    static func setUsers(gameID: String, users: [String]){
        self.ref.child("games").child(gameID).child("users").setValue(users)
    }
    
    static func setClassForUser(gameID: String, userName: String, className: String){
        self.ref.child("games").child(gameID).child(userName).child("class").setValue(className)
    }
    
    static func getClassForUser(gameID: String, userName: String, completion: @escaping (String) -> Void){
        self.ref.child("games").child(gameID).child(userName).child("class").observeSingleEvent(of: .value, with: {(snapshot) in
            if let data = snapshot.value as? String {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        })
    }
    
    static func setCardsforUser(gameID: String, userName: String, cards: [String]){
        self.ref.child("games").child(gameID).child(userName).child("cards").setValue(cards)
    }
    
    static func observeDungeonRoom(gameID: String, completion: @escaping (String) -> Void){
        self.ref.child("games").child(gameID).child("room").observe(.value, with: {(snapshot) in
            if let data = snapshot.value as? String {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        })
    }
    
    static func setDungeonRomm(gameID: String, room: String){
        self.ref.child("games").child(gameID).child("room").setValue(room)
    }
    
    static func getIsUserInCharge(gameID: String, userName: String, completion: @escaping (Bool) -> Void){
        self.ref.child("games").child(gameID).child(userName).child("inCharge").observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? Bool {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
    }
    
    static func setPlayerTurn(gameID: String, turn: Int){
        self.ref.child("games").child(gameID).child("turn").setValue(turn)
    }
    
    static func setHitPointsForUser(gameID: String, userName: String, hitPoints: Int){
        self.ref.child("games").child(gameID).child(userName).child("hitpoints").setValue(hitPoints)
    }
    
    static func setEnemyHitPoints(gameID: String, enemyName: String, hitPoints: Int){
        self.ref.child("games").child(gameID).child("enemies").child(enemyName).setValue(hitPoints)
    }
}
