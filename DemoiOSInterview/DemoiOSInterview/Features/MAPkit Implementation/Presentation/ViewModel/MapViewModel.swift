//
//  MapViewModel.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import Combine
import SwiftUI
import CoreLocation
import MapKit

final class MapViewModel: ObservableObject {

    private let fetchRouteUseCase: FetchRouteUseCase

    @Published var route: MapRoute?

    init(fetchRouteUseCase: FetchRouteUseCase) {
        self.fetchRouteUseCase = fetchRouteUseCase
    }

    func searchRoute(sourceQuery: String, destinationQuery: String) {

        Task {

            guard
                let source = await searchLocation(query: sourceQuery),
                let destination = await searchLocation(query: destinationQuery)
            else { return }

            fetchRoute(source: source, destination: destination)
        }
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

    private func searchLocation(query: String) async -> CLLocationCoordinate2D? {

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query

        let search = MKLocalSearch(request: request)

        do {
            let response = try await search.start()
            return response.mapItems.first?.placemark.coordinate
        } catch {
            print(error)
            return nil
        }
    }
}
