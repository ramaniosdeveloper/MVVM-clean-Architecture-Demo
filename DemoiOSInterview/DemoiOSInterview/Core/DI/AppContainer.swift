//
//  AppContainer.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//

final class AppContainer {

    // MARK: - Shared low-level dependencies
    private static let networkClient: NetworkClient = URLSessionNetworkClient()

    // MARK: - User
    static func makeUserViewModel() -> UserViewModel {
        let repository = UserRepositoryImpl(network: networkClient)
        let useCase = FetchUsersUseCaseImpl(repository: repository)
        return UserViewModel(fetchUsersUseCase: useCase)
    }

    // MARK: - Images
    static func makeImageViewModel() -> ImageViewModel {
        let repository = ImageRepositoryImpl(network: networkClient)
        let useCase = FetchImageUseCaseImp(repository: repository)
        return ImageViewModel(fetchImageUseCase: useCase)
    }
    
    // MARK: - Images
    static func makeMobileAdsViewModel() -> MobileAdViewModel {
        MobileAdViewModel()
    }
    
    // MARK: - DetailView
    static func makeDetailsViewmodel() -> MobileAdViewModel {
        MobileAdViewModel()
    }
}



