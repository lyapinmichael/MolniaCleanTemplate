//
//  CoachMainViewModel.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

class CoachProfileViewModel {
    
    private let useCase: CoachUseCase
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    var onStateDidChange: ((State) -> Void)?
    
    init(useCase: CoachUseCase) {
        self.useCase = useCase
    }
    
    func updateState(with viewInput: ViewInput) {
        switch viewInput {
        case .didRequestCoachProfile:
            let  coach = useCase.getCoach()
            state = .didLoadCoachProfile(coach)
        }
    }
    
    enum State {
        case initial
        case didLoadCoachProfile(Coach)
    }
    
    enum ViewInput {
        case didRequestCoachProfile
    }
    
}
