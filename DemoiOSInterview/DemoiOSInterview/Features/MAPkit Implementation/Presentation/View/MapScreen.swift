//
//  MapScreen.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import SwiftUI
import CoreLocation

struct MapScreen: View {

    @StateObject private var viewModel = AppContainer.makeMapViewModel()

    @State private var source =
        CLLocationCoordinate2D(latitude: 28.6139, longitude: 77.2090)

    @State private var destination =
        CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025)

    var body: some View {

        MapView(viewModel: viewModel)
            .edgesIgnoringSafeArea(.all)
            .onAppear {

                viewModel.fetchRoute(
                    source: source,
                    destination: destination
                )
            }
    }
}
