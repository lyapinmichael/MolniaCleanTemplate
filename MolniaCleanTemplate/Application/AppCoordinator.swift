//
//  AppCoordinator.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

class AppCoordinator: AppCoordinatorProtocol {
  
    var appFactory: AppFactoryProtocol
        
    var `navigationController`: UINavigationController
    
    var currentNavigationFlow: NavigationFlow?
    
    init(appFactory: AppFactoryProtocol, appNavigationController: UINavigationController) {
        self.appFactory = appFactory
        self.`navigationController` = appNavigationController
        
        appNavigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let loginFlow = appFactory.makeLoginFlow()
        loginFlow.rootCoordinator = self
        currentNavigationFlow = loginFlow
        
        `navigationController`.setViewControllers([loginFlow.rootViewController], animated: true)
    }
    
    func startUserFlow(for userProfile: UserProfile) {
        let userFlow = appFactory.makeUserFlow(for: userProfile)
        userFlow.rootCoordinator = self
        currentNavigationFlow = userFlow
        
        `navigationController`.setViewControllers([userFlow.rootViewController], animated: true)
    }
    
    
}
