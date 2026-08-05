//
//  HomeView.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 11/01/26.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        List(viewModel.users) { user in
            UserRowView(user: user)
        }
        .listStyle(.plain)
        .navigationTitle("Users Data")
    }
}

private struct UserRowView: View {

    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(user.name)
                .font(.headline)

            Text(user.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(user.phone)
                .font(.subheadline)

            Text(user.address.city)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 4)
    }
}

