//
//  ContentViewModel.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 09/04/26.
//

import Foundation
import Combine

@MainActor
final class ContentViewModel: ObservableObject {

    private let biometricManager: BiometricAuthenticating
    private let coordinator: AppCoordinator

    @Published var alertMessage: String?
    @Published var showAlert: Bool = false

    init(
        biometricManager: BiometricAuthenticating,
        coordinator: AppCoordinator
    ) {
        self.biometricManager = biometricManager
        self.coordinator = coordinator
    }

    func openMapWithBiometric() {
        Task {
            do {
                let success = try await biometricManager.authenticate(
                    reason: "Authenticate to open Map"
                )

                if success {
                    coordinator.goToMapView()
                }

            } catch {
                alertMessage = error.localizedDescription
                showAlert = true
            }
        }
    }
}
