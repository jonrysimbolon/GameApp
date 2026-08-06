import Combine

public protocol GetFavoritesUseCase {

    func execute() -> AnyPublisher<[Game], Error>
}

public final class GetFavoritesUseCaseImpl: GetFavoritesUseCase {

    private let repository: FavoriteRepositoryProtocol

    public init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() -> AnyPublisher<[Game], Error> {
        repository.getFavorites()
    }
}
