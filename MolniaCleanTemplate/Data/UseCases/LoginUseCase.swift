//
//  LoginUseCase.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 07.12.2023.
//

import Foundation

class LoginUseCase {
    
    func fetchUserProfile(userID: String, completion: @escaping (UserProfile) -> Void = { _ in }) async {
        if let userProfile = try? await FirestoreService.shared.fetchUserData(userID: userID){
            completion(userProfile)
        } else {
            print("Error occured while trying to fetch UserData")
        }
    }
    
        
            
}
