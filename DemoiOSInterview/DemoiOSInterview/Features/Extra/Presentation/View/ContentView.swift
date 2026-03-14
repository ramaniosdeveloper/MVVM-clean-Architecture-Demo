//
//  ContentView.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 11/01/26.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var coordinator: AppCoordinator

    @StateObject private var userVM = AppContainer.makeUserViewModel()
    @StateObject private var imageVM = AppContainer.makeImageViewModel()
    @StateObject private var mobileAdsVM = AppContainer.makeMobileAdsViewModel()
    @StateObject private var mapVM = AppContainer.makeMapViewModel()

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack(path: $coordinator.path) {

            VStack(spacing: 20) {

                Image(systemName: "applelogo")
                    .imageScale(.large)

                TextField("Enter Email", text: $email)
                    .textFieldStyle(.roundedBorder)

                SecureField("Enter Password", text: $password)
                    .textFieldStyle(.roundedBorder)

                // LOGIN BUTTON (same as before)
                PrimaryButton(title: "Login") {
                    coordinator.goToDetailView()
                }

                // TABLE VIEW STYLE LIST
                List {

                    // USERS
                    Button {
                        Task {
                            await userVM.loadUsers()

                            if !userVM.users.isEmpty {
                                coordinator.goToHome()
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "person.3.fill")
                            Text("Load Users")
                        }
                    }
                    .disabled(userVM.isLoading)

                    // IMAGES
                    Button {
                        Task {
                            await imageVM.loadImageData()

                            if !imageVM.images.isEmpty {
                                coordinator.goToImages()
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "photo")
                            Text("Load Images")
                        }
                    }
                    .disabled(imageVM.isLoading)

                    // ADS
                    Button {
                        coordinator.goToMobileAdView()
                    } label: {
                        HStack {
                            Image(systemName: "megaphone.fill")
                            Text("Show Ads")
                        }
                    }
                    // maps
                    Button {
                        coordinator.goToMapView()
                    } label: {
                        HStack {
                            Image(systemName: "map.fill")
                            Text("maps")
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .padding()

            .navigationDestination(for: AppRoute.self) { route in
                switch route {

                case .home:
                    HomeView(viewModel: userVM)

                case .images:
                    SecondView(viewModel: imageVM)

                case .adView:
                    MobileAdView(viewModel: mobileAdsVM)

                case .detailView:
                    DetailView(
                        name: "",
                        email: email,
                        password: password
                    )
                case .mapView:
                    MapScreen()
                }
            }
        }
    }
}
