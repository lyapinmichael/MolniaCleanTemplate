//
//  MockUserProfile.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 07.12.2023.
//

import Foundation

class MockUserProfile {
    
   static var mockPlayer1 = UserProfile(id: "001",
                           userType: .player,
                           firstName: "Vasya",
                           lastName: "Pupkin",
                           players: nil,
                           coach: "101")
    
    static var mockPlayer2 = UserProfile(id: "002",
                            userType: .player,
                            firstName: "Petr",
                            lastName: "Pavel",
                            players: nil,
                            coach: "101")
    
    static var mockCoach1 = UserProfile(id: "101",
                           userType: .coach,
                           firstName: "Ivan",
                           lastName: "Zalupkin",
                           players: ["001", "002"],
                           coach: nil)
   
}


