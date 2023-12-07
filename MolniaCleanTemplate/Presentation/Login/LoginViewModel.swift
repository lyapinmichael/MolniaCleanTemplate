//
//  LoginViewModel.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

class LoginViewModel {
        
    // MARK: Public properties
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    var onStateDidChange: ((State) -> Void)?
    
    // MARK: Private properties
    
    private let useCase: LoginUseCase
    
    // MARK: Init
    
    init(useCase: LoginUseCase) {
        self.useCase = useCase
        
    }
    
    // MARK: Public methods
    
    func updateState(with viewInput: ViewInput) {
        switch viewInput {
        case .didTapLoginCoachButton:
            fetchUserProfile(userID: "101")
        case .didTapLoginPlayerButton:
            return 
        }
    }
    
    // MARK: Private methods
    
    private func fetchUserProfile(userID: String) {
        
        state = .waitingForLogin
        
        Task {
            await useCase.fetchUserProfile(userID: userID) { userProfile in
                DispatchQueue.main.async {
                    self.handleUserProfile(userProfile)
                }
            }
        }
    }
    
    private func handleUserProfile(_ userProfile: UserProfile) {
        state = .proceedToUserFlow(userProfile)
    }
    
    // MARK: Types
    
    enum State {
        case initial
        case waitingForLogin
        case proceedToUserFlow(UserProfile)
    }
    
    enum ViewInput {
        case didTapLoginPlayerButton
        case didTapLoginCoachButton
    }
    
}
