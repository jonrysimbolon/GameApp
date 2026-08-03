import Combine

final class GameRepository: GameRepositoryProtocol {

    private let remote: GameRemoteDataSource

    init(remote: GameRemoteDataSource) {
        self.remote = remote
    }

    func getGames(page: Int) -> AnyPublisher<[Game], Error> {

        remote.fetchGames(page: page)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func searchGames(query: String) -> AnyPublisher<[Game], Error> {

        remote.searchGames(query: query)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func getGameDetail(id: Int) -> AnyPublisher<Game, Error> {

        remote.fetchGameDetail(id: id)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
