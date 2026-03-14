//
//  UserRepository.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 17/01/26.
//

// Repository Protocol (DIP)
protocol UserRepository{
    func fetchUsers() async throws -> [User]
}
