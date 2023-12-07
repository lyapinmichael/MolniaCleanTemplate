//
//  UserProfile.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 07.12.2023.
//

import Foundation

class UserProfile: Codable {
    
    let id: String
    let userType: UserType
    let firstName: String
    let lastName: String
    let players: [DocumentReference]?
    let coach: DocumentReference?
 
    init(id: String, userType: UserType, firstName: String, lastName: String, players: [DocumentReference]?, coach: DocumentReference?) {
        self.id = id
        self.userType = userType
        self.firstName = firstName
        self.lastName = lastName
        self.players = players
        self.coach = coach
    }
    
}

