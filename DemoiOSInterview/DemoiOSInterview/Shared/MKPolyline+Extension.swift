//
//  MKPolyline+Extension.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import MapKit

extension MKPolyline {
    
    var coordinates: [CLLocationCoordinate2D] {
        
        var coords = [CLLocationCoordinate2D](
            repeating: kCLLocationCoordinate2DInvalid,
            count: pointCount
        )
        
        getCoordinates(&coords, range: NSRange(location: 0, length: pointCount))
        
        return coords
    }
}
