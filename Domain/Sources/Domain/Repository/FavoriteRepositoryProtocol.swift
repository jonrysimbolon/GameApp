import Combine

public protocol FavoriteRepositoryProtocol {

    func getFavorites() -> AnyPublisher<[Game], Error>

    func isFavorite(id: Int) -> Bool

    func toggleFavorite(_ game: Game) -> Bool
}
