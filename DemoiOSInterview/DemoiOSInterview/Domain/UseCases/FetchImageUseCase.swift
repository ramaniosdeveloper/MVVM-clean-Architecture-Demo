//
//  FetchImageUseCase.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 18/01/26.
//

protocol FetchImageUseCase {
    func execute() async throws -> [ImageData]
}
