import Combine

protocol GameRemoteDataSource {

    func fetchGames(page: Int) -> AnyPublisher<[GameDTO], Error>

    func fetchGameDetail(id: Int) -> AnyPublisher<GameDTO, Error>

    func searchGames(query: String) -> AnyPublisher<[GameDTO], Error>
}
