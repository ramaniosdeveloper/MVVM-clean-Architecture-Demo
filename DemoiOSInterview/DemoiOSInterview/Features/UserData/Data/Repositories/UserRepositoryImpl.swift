//
//  UserRepositoryImpl.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 17/01/26.
//

import Foundation

//Repository Implementation (SRP)
class UserRepositoryImpl: UserRepository {
    
    let network: NetworkClient
    
    init(network: NetworkClient) {
        self.network = network
    }
    
    /// fetchUsers
    /// - Returns: User
    func fetchUsers() async throws -> [User] {
        try await network.request(.users)
        
    }
    
}

