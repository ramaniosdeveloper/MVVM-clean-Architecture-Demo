//
//  UserViewModel.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

import SwiftUI
import Combine

@MainActor
final class UserViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var error: String?
    @Published var isLoading = false
    private let fetchUsersUseCase: FetchUsersUseCase

    init(fetchUsersUseCase: FetchUsersUseCase) {
        self.fetchUsersUseCase = fetchUsersUseCase
    }
    
    /// Load Users

    func loadUsers() async {
        isLoading = true
        defer { isLoading = false }

        do {
            users = try await fetchUsersUseCase.execute()
        } catch {
            self.error = error.localizedDescription
        }
    }
}



