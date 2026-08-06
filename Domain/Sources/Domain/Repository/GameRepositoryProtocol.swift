import Combine

public protocol GameRepositoryProtocol {
    func getGames(page: Int) -> AnyPublisher<[Game], Error>

    func searchGames(query: String) -> AnyPublisher<[Game], Error>

    func getGameDetail(id: Int) -> AnyPublisher<Game, Error>
}
