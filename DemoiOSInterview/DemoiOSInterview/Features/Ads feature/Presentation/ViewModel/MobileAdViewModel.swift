//
//  MobileAdViewModel.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 01/02/26.
//

import SwiftUI
import Combine

@MainActor
final class MobileAdViewModel: ObservableObject {

    @Published var isAdLoaded: Bool = false
    @Published var errorMessage: String?

    func onAdLoaded() {
        isAdLoaded = true
    }

    func onAdFailed(error: String) {
        errorMessage = error
        isAdLoaded = false
    }
}
