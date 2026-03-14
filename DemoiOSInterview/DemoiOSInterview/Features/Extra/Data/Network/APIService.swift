//
//  APIService.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 14/01/26.
//

import Foundation

final class APIService {
    
    static let shared = APIService()
    
    private init() {}
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
           throw NetworkError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).description.contains(httpResponse.statusCode.description) else {
            throw NetworkError.invalidResponse
        }
        do{
            return try JSONDecoder().decode([User].self, from: data)
        }
        catch{
            throw NetworkError.decodingError
        }
        
    }
}




