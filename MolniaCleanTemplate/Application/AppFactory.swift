//
//  AppFactory.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit


class AppFactory: AppFactoryProtocol {
    
    /// По своей сути фабрика выполняет роль абстрактного DI контейнера
   
    func makeUserFlow(for userProfile: UserProfile) -> NavigationFlow {
        switch userProfile.userType {
        case .player:
            return NavigationFlow.empty
        case .coach:
            guard let coachUseCase = try? CoachUseCase(userProfile) else { return  NavigationFlow.empty }
            
            let coachMainViewModel = CoachMainViewModel(useCase: coachUseCase)
            let coachMainViewController = CoachMainViewController(viewModel: coachMainViewModel)
            let coachMainTabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), tag: 0)
            coachMainViewController.tabBarItem = coachMainTabBarItem
            
            let coachProfileViewModel = CoachProfileViewModel(useCase: coachUseCase)
            let coachProfileViewController = CoachProfileViewController(viewModel: coachProfileViewModel)
            let coachProfileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
            coachProfileViewController.tabBarItem = coachProfileTabBarItem
            
            let rootTabBar = UITabBarController()
            rootTabBar.viewControllers = [coachMainViewController, coachProfileViewController]
            
            rootTabBar.tabBar.backgroundColor = .white
        
            let coachFlow = NavigationFlow(rootViewController: rootTabBar)
            
            return coachFlow
        }
    }
    
    func makeLoginFlow() -> NavigationFlow {
        let loginUseCase = LoginUseCase()
        let loginViewModel = LoginViewModel(useCase: loginUseCase)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        
        let loginFlow = NavigationFlow(rootViewController: loginViewController)
        loginViewController.navigationFlow = loginFlow
    
        return loginFlow
    }
    
    
}
