//
//  Player.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

struct Player {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(from userProfile: UserProfile) throws {
        guard userProfile.userType == .player else { throw PlayerError.failedToConvertFromUserProfile }
        self.firstName = userProfile.firstName
        self.lastName = userProfile.lastName
    }
    
    enum PlayerError: Error {
        case failedToConvertFromUserProfile
    }
}
