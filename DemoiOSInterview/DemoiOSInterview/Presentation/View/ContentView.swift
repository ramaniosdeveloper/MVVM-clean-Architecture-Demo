//
//  ContentView.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 11/01/26.
//

import SwiftUI


struct ContentView: View {

    @EnvironmentObject private var coordinator: AppCoordinator

    @StateObject private var userVM = AppContainer.makeUserViewModel()
    @StateObject private var imageVM = AppContainer.makeImageViewModel()
    @StateObject private var mobileAdsVM = AppContainer.makeMobileAdsViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var goNext = false

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            
            VStack(spacing: 20) {
                
                Image(systemName: "applelogo")
                    .imageScale(.large)
                
                TextField("Enter Email", text: $email)
                    .textFieldStyle(.roundedBorder)

                SecureField("Enter Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                PrimaryButton(title: "Login") {
                    coordinator.goToDetailView()
                }
                
                // USERS FLOW
                PrimaryButton(title: "Load Users") {
                    Task {
                        await userVM.loadUsers()
                        
                        if !userVM.users.isEmpty {
                            coordinator.goToHome()
                        }
                    }
                }
                .disabled(userVM.isLoading)
                
                // IMAGES FLOW
                SecondaryButton(title: "Load Images") {
                    Task {
                        await imageVM.loadImageData()
                        
                        if !imageVM.images.isEmpty {
                            coordinator.goToImages()
                        }
                    }
                }
                .disabled(imageVM.isLoading)
                
                PrimaryButton(title: "Show Ad") {
                    coordinator.goToMobileAdView()
                }
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
                }
            }
        }
    }
}

