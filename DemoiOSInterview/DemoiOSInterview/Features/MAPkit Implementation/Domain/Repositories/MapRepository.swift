//
//  MapRepository.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import CoreLocation

protocol MapRepository {
    
    func fetchRoute(
        from source: CLLocationCoordinate2D,
        to destination: CLLocationCoordinate2D
    ) async throws -> MapRoute
}
