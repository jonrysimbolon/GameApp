import Combine
import CoreNetwork

public final class GameRemoteDataSourceImpl: GameRemoteDataSource {

    private let network: NetworkProvider

    public init(network: NetworkProvider) {
        self.network = network
    }

    public func fetchGames(page: Int) -> AnyPublisher<[GameDTO], Error> {

        network.request(
            endpoint: .games(page: page),
            response: GameListResponseDTO.self
        )
        .map(\.results)
        .eraseToAnyPublisher()
    }

    public func fetchGameDetail(id: Int) -> AnyPublisher<GameDTO, Error> {

        network.request(
            endpoint: .gameDetail(id: id),
            response: GameDTO.self
        )
        .eraseToAnyPublisher()
    }

    public func searchGames(query: String) -> AnyPublisher<[GameDTO], Error> {

        network.request(
            endpoint: .search(query: query),
            response: GameListResponseDTO.self
        )
        .map(\.results)
        .eraseToAnyPublisher()
    }
}
