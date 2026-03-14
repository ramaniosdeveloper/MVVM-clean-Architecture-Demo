//
//  MapScreen.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/03/26.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapScreen: View {

    @StateObject private var viewModel = AppContainer.makeMapViewModel()

    @State private var sourceText = ""
    @State private var destinationText = ""

    var body: some View {

        VStack(spacing: 10) {

            TextField("Enter Source", text: $sourceText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            TextField("Enter Destination", text: $destinationText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Find Route") {
                viewModel.searchRoute(
                    sourceQuery: sourceText,
                    destinationQuery: destinationText
                )
            }
            .buttonStyle(.borderedProminent)

            MapView(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("Map Route")
    }
}
