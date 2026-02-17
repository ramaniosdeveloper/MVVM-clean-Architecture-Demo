//
//  ImageAPIManager.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

//"https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=200"

import Foundation
import SwiftUI


class ImageAPIManager {
    static let shared = ImageAPIManager()
    
    func fetchImages() async throws -> [ImageData] {
        
        guard let url = URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=2") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpsResponse = response as? HTTPURLResponse, (200...299).description.contains(httpsResponse.statusCode.description) else  {
            throw NetworkError.invalidResponse
        }
        
        do{
            return try JSONDecoder().decode([ImageData].self, from: data)
        }
        catch {
            throw NetworkError.decodingError
        }
    }
    
}
