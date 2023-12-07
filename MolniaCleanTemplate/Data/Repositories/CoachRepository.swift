//
//  CoachRepository.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

class CoachRepository {
    
    var coach: Coach
    var players: [Player] = []
    
    init(_ coach: Coach) {
        self.coach = coach
    }
    
    
}
