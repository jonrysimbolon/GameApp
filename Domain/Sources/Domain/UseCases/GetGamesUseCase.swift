import Combine

public protocol GetGamesUseCase {
    func execute(page: Int) -> AnyPublisher<[Game], Error>
}

public final class GetGamesUseCaseImpl: GetGamesUseCase {

    private let repository: GameRepositoryProtocol

    public init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(page: Int) -> AnyPublisher<[Game], Error> {
        repository.getGames(page: page)
    }
}
