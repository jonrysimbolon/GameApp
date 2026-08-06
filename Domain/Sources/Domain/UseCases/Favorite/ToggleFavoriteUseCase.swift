public protocol ToggleFavoriteUseCase {

    func execute(game: Game) -> Bool
}

public final class ToggleFavoriteUseCaseImpl: ToggleFavoriteUseCase {

    private let repository: FavoriteRepositoryProtocol

    public init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(game: Game) -> Bool {
        repository.toggleFavorite(game)
    }
}
