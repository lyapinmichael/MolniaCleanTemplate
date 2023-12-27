////  CoachMainViewModel.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

class CoachMainViewModel {
    
    private let useCase: CoachUseCase
    private let repository: CoachRepository
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    var onStateDidChange: ((State) -> Void)?
    
    init(useCase: CoachUseCase, repository: CoachRepository) {
        self.useCase = useCase
        self.repository = repository
        
        repository.players.bind { [weak self] players in
            self?.state = .didLoadPlayers(players)
        }
    }
    
    func updateState(with viewInput: ViewInput) {
        switch viewInput {
        case .didRequestPlayers:
            let players = useCase.getPlayers()
            DispatchQueue.main.async {
                self.state = .didLoadPlayers(players)
            }
            
        }
    }
    
    enum State {
        case initial
        case didLoadPlayers([Player])
    }
    
    enum ViewInput {
        case didRequestPlayers
    }
}
