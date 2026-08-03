import Combine

protocol SearchGamesUseCase {
    func execute(query: String) -> AnyPublisher<[Game], Error>
}

final class SearchGamesUseCaseImpl: SearchGamesUseCase {

    private let repository: GameRepositoryProtocol

    init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    func execute(query: String) -> AnyPublisher<[Game], Error> {
        repository.searchGames(query: query)
    }
}
