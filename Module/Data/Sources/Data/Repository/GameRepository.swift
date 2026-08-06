import Domain

import Combine

public final class GameRepository: GameRepositoryProtocol {

    private let remote: GameRemoteDataSource

    public init(remote: GameRemoteDataSource) {
        self.remote = remote
    }

    public func getGames(page: Int) -> AnyPublisher<[Game], Error> {

        remote.fetchGames(page: page)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    public func searchGames(query: String) -> AnyPublisher<[Game], Error> {

        remote.searchGames(query: query)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    public func getGameDetail(id: Int) -> AnyPublisher<Game, Error> {

        remote.fetchGameDetail(id: id)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
