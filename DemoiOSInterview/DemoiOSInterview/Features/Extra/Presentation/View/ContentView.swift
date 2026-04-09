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

    @StateObject private var viewModel: ContentViewModel

    @State private var email = ""
    @State private var password = ""

    init(coordinator: AppCoordinator) {
        _viewModel = StateObject(
            wrappedValue: ContentViewModel(
                biometricManager: AppContainer.makeBiometricManager(),
                coordinator: coordinator
            )
        )
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {

            VStack(spacing: 20) {

                Image(systemName: "applelogo")

                TextField("Enter Email", text: $email)
                    .textFieldStyle(.roundedBorder)

                SecureField("Enter Password", text: $password)
                    .textFieldStyle(.roundedBorder)

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
                        Label("Load Users", systemImage: "person.3.fill")
                    }

                    // IMAGES
                    Button {
                        Task {
                            await imageVM.loadImageData()

                            if !imageVM.images.isEmpty {
                                coordinator.goToImages()
                            }
                        }
                    } label: {
                        Label("Load Images", systemImage: "photo")
                    }

                    // ADS
                    Button {
                        coordinator.goToMobileAdView()
                    } label: {
                        Label("Show Ads", systemImage: "megaphone.fill")
                    }

                    // CLEAN CALL
                    Button {
                        viewModel.openMapWithBiometric()
                    } label: {
                        Label("Maps (Biometric)", systemImage: "map.fill")
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
                    DetailView(name: "", email: email, password: password)

                case .mapView:
                    MapScreen()
                }
            }
        }
        .alert("Authentication Error", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.alertMessage ?? "")
        }
    }
}
