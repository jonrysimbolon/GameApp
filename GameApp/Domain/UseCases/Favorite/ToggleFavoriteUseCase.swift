protocol ToggleFavoriteUseCase {

    func execute(game: Game) -> Bool
}

final class ToggleFavoriteUseCaseImpl: ToggleFavoriteUseCase {

    private let repository: FavoriteRepositoryProtocol

    init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    func execute(game: Game) -> Bool {
        repository.toggleFavorite(game)
    }
}
