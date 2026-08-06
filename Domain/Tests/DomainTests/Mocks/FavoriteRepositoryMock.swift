import Foundation
import Domain
import Combine

final class FavoriteRepositoryMock: FavoriteRepositoryProtocol {

    var favorites: [Game] = []
    var favoriteIds: Set<Int> = []

    func getFavorites() -> AnyPublisher<[Game], Error> {

        Just(favorites)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func isFavorite(id: Int) -> Bool {
        favoriteIds.contains(id)
    }

    func toggleFavorite(_ game: Game) -> Bool {

        if favoriteIds.contains(game.id) {

            favoriteIds.remove(game.id)
            return false

        } else {

            favoriteIds.insert(game.id)
            return true
        }
    }
}
