//
//  FirestoreService.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 07.12.2023.
//

import Foundation

class FirestoreService {
    
    static let shared = FirestoreService()
    
    private var mockData = [MockUserProfile.mockCoach1, MockUserProfile.mockPlayer1]
    
    func fetchUserData(userID: String) async throws -> UserProfile? {
       /// Не углубляйтесь пока сюда, это нужно просто для симуляции асинхронного возврата с задержкой
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                continuation.resume(returning: self?.mockData.first(where: { $0.id == userID }))
            }
        }
       
    }
    
    func fetchUserData(documentReference: DocumentReference) async throws -> UserProfile? {
        /// Не углубляйтесь пока сюда, это нужно просто для симуляции асинхронного возврата с задержкой
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                continuation.resume(returning: self?.mockData.first(where: { $0.id == documentReference }))
            }
        }
        
    }
    
    
    private init() {}
    
}
