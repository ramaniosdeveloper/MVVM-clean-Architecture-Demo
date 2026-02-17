//
//  SecondView.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 27/01/26.
//

import SwiftUI

struct SecondView: View {

    @ObservedObject var viewModel: ImageViewModel

    var body: some View {
        List(viewModel.images) { image in
            HStack {
                AsyncImage(
                    url: URL(string: image.backupDetails.screenshotURL)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()

                    case .success(let img):
                        img
                            .resizable()
                            .scaledToFill()

                    case .failure:
                        Image(systemName: "photo")

                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Text(image.title)
            }
        }
        .navigationTitle("Images")
    }
}



