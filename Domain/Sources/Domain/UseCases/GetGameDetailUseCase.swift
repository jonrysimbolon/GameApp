import Combine

public protocol GetGameDetailUseCase {
    func execute(id: Int) -> AnyPublisher<Game, Error>
}

public final class GetGameDetailUseCaseImpl: GetGameDetailUseCase {

    private let repository: GameRepositoryProtocol

    public init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: Int) -> AnyPublisher<Game, Error> {
        repository.getGameDetail(id: id)
    }
}
