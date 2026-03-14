//
//  FetchRouteUseCase.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import CoreLocation

protocol FetchRouteUseCase {
    
    func execute(
        source: CLLocationCoordinate2D,
        destination: CLLocationCoordinate2D
    ) async throws -> MapRoute
}
