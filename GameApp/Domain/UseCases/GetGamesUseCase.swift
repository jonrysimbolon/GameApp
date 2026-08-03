import Combine

protocol GetGamesUseCase {
    func execute(page: Int) -> AnyPublisher<[Game], Error>
}

final class GetGamesUseCaseImpl: GetGamesUseCase {

    private let repository: GameRepositoryProtocol

    init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    func execute(page: Int) -> AnyPublisher<[Game], Error> {
        repository.getGames(page: page)
    }
}
