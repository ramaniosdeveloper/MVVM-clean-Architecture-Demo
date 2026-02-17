//
//  DemoiOSInterviewApp.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 11/01/26.
//

import SwiftUI
import GoogleMobileAds


@main
struct DemoiOSInterviewApp: App {

    @StateObject private var coordinator = AppCoordinator()

    init() {
        // ✅ NEW API — correct
        MobileAds.shared.start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
        }
    }
}


