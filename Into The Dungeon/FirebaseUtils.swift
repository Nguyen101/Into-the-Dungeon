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
    
    static func getGameData(gameID: String) -> Any?{
        var gameData: Any? = nil
        self.ref.child("games").child(gameID).observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value as? Any {
                gameData = data
            }
        })
        
        return gameData
    }
    
    static func getUserData(gameID: String, userName: String) -> Any?{
        var userData: Any? = nil
        
        self.ref.child("games").child(gameID).child(userName).observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value as? Any {
                userData = data
            }
        })
        return userData
    }
    
    static func setUserData(gameID: String, userName: String, userData: Any){
        self.ref.child("games").child(gameID).child(userName).setValue(userData)
    }
    
    static func getUserName(gameID: String, userName: String) -> String? {
        var name: String? = nil
        
        self.ref.child("games").child(gameID).child(userName).child("name").observeSingleEvent(of: .value, with: { (sanpshot) in
            if let data = sanpshot.value as? String {
                print("test: " + data)
                name = data
                DispatchQueue.main.async {
                    
                }
            }
        })
        return name
    }
}
