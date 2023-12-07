//
//  NavigationFlow.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 07.12.2023.
//

import UIKit

class NavigationFlow {
    static var empty: NavigationFlow {
        return NavigationFlow(rootViewController: UIViewController())
    }
    
    weak var rootCoordinator: AppCoordinator?
    var rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    
}
