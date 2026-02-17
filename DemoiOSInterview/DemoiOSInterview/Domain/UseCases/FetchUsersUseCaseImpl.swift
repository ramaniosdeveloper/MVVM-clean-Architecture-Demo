//
//  FetchUsersUseCaseImpl.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

final class FetchUsersUseCaseImpl: FetchUsersUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> [User] {
        try await repository.fetchUsers()
    }
}
