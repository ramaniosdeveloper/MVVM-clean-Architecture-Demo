//
//  HomeView.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 11/01/26.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .navigationTitle("Users")
    }
}

