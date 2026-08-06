public protocol IsFavoriteUseCase {

    func execute(id: Int) -> Bool
}

public final class IsFavoriteUseCaseImpl: IsFavoriteUseCase {

    private let repository: FavoriteRepositoryProtocol

    public init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: Int) -> Bool {
        repository.isFavorite(id: id)
    }
}
