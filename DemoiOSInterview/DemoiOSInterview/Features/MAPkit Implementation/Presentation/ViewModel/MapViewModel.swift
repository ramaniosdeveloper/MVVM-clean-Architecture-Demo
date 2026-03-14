//
//  MapViewModel.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import Combine
import SwiftUI
import CoreLocation

final class MapViewModel: ObservableObject {
    
    private let fetchRouteUseCase: FetchRouteUseCase
    
    @Published var route: MapRoute?
    
    init(fetchRouteUseCase: FetchRouteUseCase) {
        self.fetchRouteUseCase = fetchRouteUseCase
    }
    
    func fetchRoute(
        source: CLLocationCoordinate2D,
        destination: CLLocationCoordinate2D
    ) {
        
        Task {
            do {
                let result = try await fetchRouteUseCase.execute(
                    source: source,
                    destination: destination
                )
                
                await MainActor.run {
                    self.route = result
                }
            } catch {
                print(error)
            }
        }
    }
}
