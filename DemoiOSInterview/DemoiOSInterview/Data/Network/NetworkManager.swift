//
//  NetworkManager.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

import SwiftUI

class NetWorkManager {
    static let shared = NetWorkManager()
    
    func fetchDetails() async throws -> ProductResponse {
        guard let url = URL(string: "https://fakeapi.net/products?page=0&limit=10&category=electronics") else{
           throw NetworkError.invalidURL
            }
            
            let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<299).description.contains(httpResponse.statusCode.description) else {
          throw  NetworkError.serverError((response as? HTTPURLResponse)?.statusCode ?? 500)
        }
        do {
            return try JSONDecoder().decode(ProductResponse.self, from: data)
        } catch{
            throw NetworkError.decodingError
        }
         
    }
    
}

