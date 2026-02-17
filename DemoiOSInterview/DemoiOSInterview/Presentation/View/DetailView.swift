//
//  DetailView.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 11/01/26.
//

import SwiftUI


struct DetailView: View {
    
    let name: String
    @State private var title: String = "Loading..."
    let email: String
    let password: String
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Email: \(email)")
            Text("Password: \(password)")
        }
        
        Text("Selected: \(name)")
            .font(.largeTitle)
            .navigationTitle("Detail")
            .task(id: name ) {
                await loadData()
            }
    }

    @MainActor
    func loadData() async {
        do {
            switch name {
            case "iOS":
                let fetchDetails = try await NetWorkManager.shared.fetchDetails()
                title = fetchDetails.data.first?.title ?? "No Title"
                print("fetch Details", fetchDetails)
            case "Objective-C":
                let fetchImages = try await ImageAPIManager.shared.fetchImages()
                title = fetchImages.first?.title ?? "No Title"
               
                print("fetch Images data", fetchImages)
            case "Swift":
                let fetchUSer = try await APIService.shared.fetchUsers()
                title = fetchUSer.first?.name ?? "No Name"
                print("user", fetchUSer)
            default:
                print("No Api call")
            }
            
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
}
