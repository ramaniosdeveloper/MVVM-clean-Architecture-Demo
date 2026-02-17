//
//  FetchUsersUseCase.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//


protocol FetchUsersUseCase {
    func execute() async throws -> [User]
}

