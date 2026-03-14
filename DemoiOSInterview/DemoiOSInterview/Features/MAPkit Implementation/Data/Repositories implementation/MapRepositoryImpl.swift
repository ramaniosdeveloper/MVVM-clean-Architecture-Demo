//
//  MapRepositoryImpl.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import MapKit

final class MapRepositoryImpl: MapRepository {
    
    func fetchRoute(
        from source: CLLocationCoordinate2D,
        to destination: CLLocationCoordinate2D
    ) async throws -> MapRoute {
        
        let sourcePlacemark = MKPlacemark(coordinate: source)
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: sourcePlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        let response = try await directions.calculate()
        
        guard let route = response.routes.first else {
            throw NSError(domain: "RouteError", code: 0)
        }
        
        let coordinates = route.polyline.coordinates
        
        return MapRoute(
            polylineCoordinates: coordinates,
            distance: route.distance,
            expectedTime: route.expectedTravelTime
        )
    }
}
