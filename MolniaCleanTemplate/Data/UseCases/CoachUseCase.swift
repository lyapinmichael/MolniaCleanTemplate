//
//  CoachUseCase.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

class CoachUseCase {
    
    var repository: CoachRepository
    
    private var coachUserProfile: UserProfile
    
    init(_ userProfile: UserProfile) throws {
        self.coachUserProfile = userProfile
        
        guard let coach = try? Coach(from: userProfile) else { throw CoachUseCaseError.failedToInitializeCoachFromUserProfile }
        repository = CoachRepository(coach)
    }
    
    func getCoach() -> Coach {
        /// здесь может быть всякая логика, например:
        /// зпроси данные в репозитории, если их там нет - сходи в сеть, получи
        /// данные, положи в репозиторий и отдай тому, то вызвал функцию
        return repository.coach
    }
    
    func getPlayers() -> [Player] {
        if repository.players.value.isEmpty {
            Task {
                await fetchPlayers()
            }
        }
        return repository.players.value
        
    }
    
    func fetchPlayers() async {
        guard let playerReferences = coachUserProfile.players else { return }
        
        var players: [Player] = []
        for playerReference in playerReferences {
            if let playerUserProfile = try? await FirestoreService.shared.fetchUserData(documentReference: playerReference),
               let player = try? Player(from: playerUserProfile) {
                players.append(player)
            }
        }
        repository.players.value = players
    }
    
    func sendToServer(newName: String, completion: @escaping (Error?) -> Void ) {
        
    }
    
    enum CoachUseCaseError: Error {
        case failedToInitializeCoachFromUserProfile
    }
    
}
