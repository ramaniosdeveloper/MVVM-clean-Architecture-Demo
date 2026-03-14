//
//  ImageReporisitory.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 18/01/26.
//

protocol ImageRepository {
    func fetchImage() async throws -> [ImageData]
}
