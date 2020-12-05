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
    
    static func getGameData(gameID: String, completion: @escaping (Any?) -> Void) {
        var gameData: Any? = nil
        self.ref.child("games").child(gameID).observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value as? Any {
                gameData = data
                DispatchQueue.main.async{
                    completion(gameData)
                }
            }
        })
        
    }
    
    static func setGameData(gameID: String, gameData: Any){
        self.ref.child("games").child(gameID).setValue(gameData)
    }
    
    static func getUserData(gameID: String, userName: String, completion: @escaping (Any?) -> Void) -> Void{
        var userData: Any? = nil
        
        self.ref.child("games").child(gameID).child(userName).observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value as? Any {
                userData = data
                DispatchQueue.main.async {
                    completion(userData)
                }
            }
        })
    }
    
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
            
            print("TEST 4")
            print(snapshot.value)
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
}
