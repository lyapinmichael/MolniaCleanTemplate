//
//  AppCoordinatorProtocol.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
  
    var appFactory: AppFactoryProtocol { get }
    
    func startUserFlow(for userProfile: UserProfile)
    
}



