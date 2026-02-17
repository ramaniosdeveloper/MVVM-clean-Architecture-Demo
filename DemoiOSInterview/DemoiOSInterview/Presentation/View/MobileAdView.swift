//
//  MobileAdView.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 01/02/26.
//

import SwiftUI

struct MobileAdView: View {

    @ObservedObject var viewModel: MobileAdViewModel
    var body: some View {
        VStack(spacing: 16) {

            Text("Sponsored")
                .font(.headline)

            BannerAdView()
                .frame(height: 50)

            if viewModel.isAdLoaded {
                Text("Ad loaded successfully")
                    .font(.caption)
                    .foregroundColor(.green)
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
