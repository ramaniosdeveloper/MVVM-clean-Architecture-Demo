//
//  NetworkClient.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 17/01/26.
//

import  Foundation

// Network Layer (Actor – Thread Safe)
protocol NetworkClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
