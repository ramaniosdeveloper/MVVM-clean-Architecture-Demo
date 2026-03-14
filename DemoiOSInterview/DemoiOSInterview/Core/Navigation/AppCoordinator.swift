//
//  AppCoordinator.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 27/01/26.
//

import SwiftUI
import Combine

enum AppRoute: Hashable {
    case home
    case images
    case adView
    case detailView
    case mapView
    
}

final class AppCoordinator: ObservableObject {

    @Published var path = NavigationPath()
    
    /// Home navigation
    func goToHome() {
        path.append(AppRoute.home)
    }

    func goToImages() {
        path.append(AppRoute.images)
    }

    
    func goToMobileAdView() {
        path.append(AppRoute.adView)
    }
    
    func goToDetailView() {
        path.append(AppRoute.detailView)
    }
    
    func goToMapView() {
        path.append(AppRoute.mapView)
    }

    func reset() {
        path = NavigationPath()
    }
}
          


