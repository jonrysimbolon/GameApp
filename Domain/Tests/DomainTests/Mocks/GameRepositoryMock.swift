import Foundation
import Domain
import Combine

final class GameRepositoryMock: GameRepositoryProtocol {

    var games: [Game] = []
    var gameDetail: Game?

    func getGames(page: Int) -> AnyPublisher<[Game], Error> {

        Just(games)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func searchGames(query: String) -> AnyPublisher<[Game], Error> {

        Just(games)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getGameDetail(id: Int) -> AnyPublisher<Game, Error> {

        Just(gameDetail!)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
