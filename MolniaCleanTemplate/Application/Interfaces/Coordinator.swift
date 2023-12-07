//
//  Coordinator.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var `navigationController`: UINavigationController { get }
    
    func start()
    
}
