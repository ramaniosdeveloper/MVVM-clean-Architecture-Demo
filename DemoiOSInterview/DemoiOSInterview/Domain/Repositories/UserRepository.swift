//
//  UserRepository.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

// Repository Protocol (DIP)
protocol UserRepository{
    func fetchUsers() async throws -> [User]
}
