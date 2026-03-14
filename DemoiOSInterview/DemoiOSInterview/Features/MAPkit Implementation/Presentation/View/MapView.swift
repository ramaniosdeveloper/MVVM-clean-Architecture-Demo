//
//  MapView.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    @ObservedObject var viewModel: MapViewModel

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {

        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {

        guard let route = viewModel.route else { return }

        // Remove old overlays
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)

        // Draw polyline
        let polyline = MKPolyline(coordinates: route.polylineCoordinates,
                                  count: route.polylineCoordinates.count)

        mapView.addOverlay(polyline)

        // Source Pin
        if let first = route.polylineCoordinates.first {

            let sourcePin = MKPointAnnotation()
            sourcePin.coordinate = first
            sourcePin.title = "Source"

            mapView.addAnnotation(sourcePin)
        }

        // Destination Pin
        if let last = route.polylineCoordinates.last {

            let destinationPin = MKPointAnnotation()
            destinationPin.coordinate = last
            destinationPin.title = "Destination"

            mapView.addAnnotation(destinationPin)
        }

        // Zoom map to route
        mapView.setVisibleMapRect(
            polyline.boundingMapRect,
            edgePadding: UIEdgeInsets(top: 80, left: 40, bottom: 80, right: 40),
            animated: true
        )
    }

    // MARK: - Coordinator

    class Coordinator: NSObject, MKMapViewDelegate {

        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView,
                     rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

            if let polyline = overlay as? MKPolyline {

                let renderer = MKPolylineRenderer(polyline: polyline)

                renderer.strokeColor = .systemBlue
                renderer.lineWidth = 5

                return renderer
            }

            return MKOverlayRenderer()
        }
    }
}
