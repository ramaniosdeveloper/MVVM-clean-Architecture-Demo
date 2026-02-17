//
//  URLSessionNetworkClient.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

import Foundation

actor URLSessionNetworkClient: NetworkClient  {

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {

        let (data, response) = try await URLSession.shared.data(from: endpoint.url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
