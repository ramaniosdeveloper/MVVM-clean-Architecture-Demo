//
//  FetchRouteUseCaseImpl.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import CoreLocation
import SwiftUI

final class FetchRouteUseCaseImpl: FetchRouteUseCase {
    
    private let repository: MapRepository
    
    init(repository: MapRepository) {
        self.repository = repository
    }
    
    func execute(
        source: CLLocationCoordinate2D,
        destination: CLLocationCoordinate2D
    ) async throws -> MapRoute {
        
        return try await repository.fetchRoute(
            from: source,
            to: destination
        )
    }
}
