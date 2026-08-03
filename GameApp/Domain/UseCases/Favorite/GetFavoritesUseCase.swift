import Combine

protocol GetFavoritesUseCase {

    func execute() -> AnyPublisher<[Game], Error>
}

final class GetFavoritesUseCaseImpl: GetFavoritesUseCase {

    private let repository: FavoriteRepositoryProtocol

    init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Game], Error> {
        repository.getFavorites()
    }
}
