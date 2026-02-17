//
//  ImageViewModel.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 18/01/26.
//

import SwiftUI
import Combine

@MainActor
class ImageViewModel: ObservableObject {
    
    @Published var images: [ImageData] = []
    @Published var error: String?
    @Published var isLoading = false
    
    let fetchImageUseCase: FetchImageUseCase
    
    init(fetchImageUseCase: FetchImageUseCase) {
        self.fetchImageUseCase = fetchImageUseCase
    }
    
    
    /// loadImageData
    func loadImageData() async {
        do{
            isLoading = true
            images = try await fetchImageUseCase.execute()
            isLoading = false
        }
        catch{
            self.error = error.localizedDescription
        }
    }
    
}
