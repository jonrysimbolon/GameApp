protocol IsFavoriteUseCase {

    func execute(id: Int) -> Bool
}

final class IsFavoriteUseCaseImpl: IsFavoriteUseCase {

    private let repository: FavoriteRepositoryProtocol

    init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    func execute(id: Int) -> Bool {
        repository.isFavorite(id: id)
    }
}
