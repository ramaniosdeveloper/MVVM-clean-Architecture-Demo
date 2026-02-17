//
//  ImageReporisitory.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 18/01/26.
//

protocol ImageRepository {
    func fetchImage() async throws -> [ImageData]
}
