import Combine

final class GameRemoteDataSourceImpl: GameRemoteDataSource {

    private let network: NetworkProvider

    init(network: NetworkProvider) {
        self.network = network
    }

    func fetchGames(page: Int) -> AnyPublisher<[GameDTO], Error> {

        network.request(
            endpoint: .games(page: page),
            response: GameListResponseDTO.self
        )
        .map(\.results)
        .eraseToAnyPublisher()
    }

    func fetchGameDetail(id: Int) -> AnyPublisher<GameDTO, Error> {

        network.request(
            endpoint: .gameDetail(id: id),
            response: GameDTO.self
        )
        .eraseToAnyPublisher()
    }

    func searchGames(query: String) -> AnyPublisher<[GameDTO], Error> {

        network.request(
            endpoint: .search(query: query),
            response: GameListResponseDTO.self
        )
        .map(\.results)
        .eraseToAnyPublisher()
    }
}
