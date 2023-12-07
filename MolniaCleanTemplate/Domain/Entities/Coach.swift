//
//  Coach.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation


struct Coach {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(from userProfile: UserProfile) throws {
        guard userProfile.userType == .coach else { throw CoachError.failedToConvertFromUserProfile }
        self.firstName = userProfile.firstName
        self.lastName = userProfile.lastName
    }
    
    enum CoachError: Error {
        case failedToConvertFromUserProfile
    }
}
