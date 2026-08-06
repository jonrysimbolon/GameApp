import Domain

import CoreData

import Combine

public final class FavoriteRepository: FavoriteRepositoryProtocol {

    private let local: FavoriteLocalDataSource
    private let context: NSManagedObjectContext

    public init(
        local: FavoriteLocalDataSource,
        context: NSManagedObjectContext
    ) {
        self.local = local
        self.context = context
    }

    public func getFavorites() -> AnyPublisher<[Game], Error> {

        Future { [weak self] promise in

            guard let self else { return }

            do {

                let games = try local
                    .fetchFavorites()
                    .map { $0.toDomain() }

                promise(.success(games))

            } catch {

                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }

    public func isFavorite(id: Int) -> Bool {

        do {

            guard let entity = try local.fetchFavorite(id: id) else {
                return false
            }

            return entity.isFav

        } catch {

            return false
        }
    }

    public func toggleFavorite(_ game: Game) -> Bool {

        do {

            if let entity = try local.fetchFavorite(id: game.id) {

                entity.isFav.toggle()

                try local.update(game: entity)

                return entity.isFav

            } else {

                let entity = GameEntity(context: context)

                entity.update(from: game)
                entity.isFav = true

                try local.save(game: entity)

                return true
            }

        } catch {

            return false
        }
    }
}
