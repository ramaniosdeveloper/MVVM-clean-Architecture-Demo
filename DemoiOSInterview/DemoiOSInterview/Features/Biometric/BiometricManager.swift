//
//  BiometricManager.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 09/04/26.
//

/// BiometricManager
/// A lightweight wrapper around LocalAuthentication's LAContext that exposes
/// an async/await API for authenticating the current device owner using
/// biometrics or passcode. Use this when you want to gate access to sensitive
/// features or data behind Face ID / Touch ID with a passcode fallback.
import LocalAuthentication

/// Abstraction for performing biometric or device owner authentication.
/// Conformers provide an async API that resolves to `true` on success or
/// throws an error when authentication cannot be performed or fails.
protocol BiometricAuthenticating {
    /// Attempts to authenticate the user using biometrics or device passcode.
    /// - Parameter reason: A localized string that explains why authentication is needed. This is shown in the system prompt.
    /// - Returns: `true` if authentication succeeds.
    /// - Throws: An error if the device cannot evaluate the policy or if authentication fails/cancels.
    func authenticate(reason: String) async throws -> Bool
}

/// Default implementation backed by `LAContext`.
/// - Uses `.deviceOwnerAuthentication` to allow biometric auth with passcode fallback.
/// - Wraps `evaluatePolicy` in `withCheckedThrowingContinuation` for async usage.
final class BiometricManager: BiometricAuthenticating {

    /// Performs device owner authentication using Face ID/Touch ID with passcode fallback.
    ///
    /// This method first checks capability via `canEvaluatePolicy` and then evaluates
    /// `.deviceOwnerAuthentication`, which permits the system to fall back to the device passcode
    /// if biometrics are unavailable or fail. Errors surfaced are the same as produced by
    /// `LAContext` (commonly bridged as `NSError` with `kLAErrorDomain`).
    ///
    /// - Parameter reason: A user-facing reason displayed by the system authentication prompt.
    /// - Returns: `true` when authentication succeeds.
    /// - Throws: The underlying `LAError` (as `NSError`) when evaluation isn't possible or fails.
    func authenticate(reason: String) async throws -> Bool {
        let context = LAContext()
        // New LAContext per attempt ensures a clean state.
        var error: NSError?
        // `LAContext` APIs surface errors as NSError (kLAErrorDomain/LAError codes).

        // Check whether the device can evaluate the chosen policy up front.
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            throw error ?? NSError(domain: "BiometricError", code: -1)
        }

        // Bridge the callback-based API into async/await using a throwing continuation.
        return try await withCheckedThrowingContinuation { continuation in
            context.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: reason) { success, authError in

                // Successful authentication; resume with `true`.
                if success {
                    continuation.resume(returning: true)
                } else {
                    // Authentication failed or was cancelled; propagate the underlying error.
                    continuation.resume(throwing: authError ?? NSError(domain: "AuthFailed", code: -2))
                }
            }
        }
    }
}

