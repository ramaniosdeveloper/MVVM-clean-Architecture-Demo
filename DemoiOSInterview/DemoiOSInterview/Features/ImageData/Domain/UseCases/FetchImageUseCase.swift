//
//  FetchImageUseCase.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 18/01/26.
//

protocol FetchImageUseCase {
    func execute() async throws -> [ImageData]
}
