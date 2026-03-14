//
//  MapRoute.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import CoreLocation

struct MapRoute {
    let polylineCoordinates: [CLLocationCoordinate2D]
    let distance: Double
    let expectedTime: Double
}
