import Combine

protocol GetGameDetailUseCase {
    func execute(id: Int) -> AnyPublisher<Game, Error>
}

final class GetGameDetailUseCaseImpl: GetGameDetailUseCase {

    private let repository: GameRepositoryProtocol

    init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    func execute(id: Int) -> AnyPublisher<Game, Error> {
        repository.getGameDetail(id: id)
    }
}
