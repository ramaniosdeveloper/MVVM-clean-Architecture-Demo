//
//  ImageRepositoryImpl.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 18/01/26.
//

import Foundation
import Combine
import SwiftUI

class ImageRepositoryImpl: ImageRepository {
    
    
    let network: NetworkClient
    
    init(network: NetworkClient) {
        self.network = network
    }
    
    /// fetchImages
    /// - Returns: ImageData
    func fetchImage() async throws -> [ImageData] {
        try await network.request(.images)
    }
    
}
