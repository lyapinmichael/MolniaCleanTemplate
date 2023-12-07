//
//  AppFactoryProtocol.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

protocol AppFactoryProtocol: AnyObject {
    
    func makeUserFlow(for userProfile: UserProfile) -> NavigationFlow
    func makeLoginFlow() -> NavigationFlow
    
}
