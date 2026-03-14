//
//  FetchImageUseCaseImp.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 18/01/26.
//

struct FetchImageUseCaseImp: FetchImageUseCase {

    let repository: ImageRepository
    
    init(repository: ImageRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [ImageData] {
        try await repository.fetchImage()
    }
    
}
