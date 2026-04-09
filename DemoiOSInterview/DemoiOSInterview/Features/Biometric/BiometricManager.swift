//
//  BiometricManager.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 09/04/26.
//

import LocalAuthentication

protocol BiometricAuthenticating {
    func authenticate(reason: String) async throws -> Bool
}

final class BiometricManager: BiometricAuthenticating {

    func authenticate(reason: String) async throws -> Bool {
        let context = LAContext()
        var error: NSError?

        // ✅ Check capability
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            throw error ?? NSError(domain: "BiometricError", code: -1)
        }

        // ✅ Async wrapper
        return try await withCheckedThrowingContinuation { continuation in
            context.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: reason) { success, authError in

                if success {
                    continuation.resume(returning: true)
                } else {
                    continuation.resume(throwing: authError ?? NSError(domain: "AuthFailed", code: -2))
                }
            }
        }
    }
}
