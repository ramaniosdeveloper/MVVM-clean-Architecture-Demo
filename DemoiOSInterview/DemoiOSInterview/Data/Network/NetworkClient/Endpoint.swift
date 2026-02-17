//
//  Endpoint.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

import Foundation

enum Endpoint {
    case users
    case images

    var url: URL {
        switch self {
        case .users:
            return URL(string: "https://jsonplaceholder.typicode.com/users")!
        case .images:
            return URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=50")!
        }
    }
}
