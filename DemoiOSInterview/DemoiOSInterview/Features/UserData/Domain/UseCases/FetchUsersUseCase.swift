//
//  FetchUsersUseCase.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 17/01/26.
//


protocol FetchUsersUseCase {
    func execute() async throws -> [User]
}

