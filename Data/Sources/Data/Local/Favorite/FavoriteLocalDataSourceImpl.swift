import CoreData

public final class FavoriteLocalDataSourceImpl: FavoriteLocalDataSource {

    private let context: NSManagedObjectContext

    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    public func fetchFavorites() throws -> [GameEntity] {

        let request = GameEntity.fetchRequest()
        request.predicate = NSPredicate(format: "isFav == YES")
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]

        return try context.fetch(request)
    }

    public func fetchFavorite(id: Int) throws -> GameEntity? {

        let request = GameEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %d", id)

        return try context.fetch(request).first
    }

    public func save(game: GameEntity) throws {

        if context.hasChanges {
            try context.save()
        }

        NotificationCenter.default.post(
            name: .favoritesDidChange,
            object: nil
        )
    }

    public func update(game: GameEntity) throws {

        if context.hasChanges {
            try context.save()
        }

        NotificationCenter.default.post(
            name: .favoritesDidChange,
            object: nil
        )
    }

    public func delete(game: GameEntity) throws {

        context.delete(game)

        if context.hasChanges {
            try context.save()
        }

        NotificationCenter.default.post(
            name: .favoritesDidChange,
            object: nil
        )
    }
}
