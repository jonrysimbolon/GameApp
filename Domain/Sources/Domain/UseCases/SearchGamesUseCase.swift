import Combine

public protocol SearchGamesUseCase {
    func execute(query: String) -> AnyPublisher<[Game], Error>
}

public final class SearchGamesUseCaseImpl: SearchGamesUseCase {

    private let repository: GameRepositoryProtocol

    public init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String) -> AnyPublisher<[Game], Error> {
        repository.searchGames(query: query)
    }
}
