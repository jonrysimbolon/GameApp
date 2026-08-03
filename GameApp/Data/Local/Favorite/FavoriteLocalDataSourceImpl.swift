import CoreData

final class FavoriteLocalDataSourceImpl: FavoriteLocalDataSource {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func fetchFavorites() throws -> [GameEntity] {

        let request = GameEntity.fetchRequest()
        request.predicate = NSPredicate(format: "isFav == YES")
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]

        return try context.fetch(request)
    }

    func fetchFavorite(id: Int) throws -> GameEntity? {

        let request = GameEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %d", id)

        return try context.fetch(request).first
    }

    func save(game: GameEntity) throws {

        if context.hasChanges {
            try context.save()
        }

        NotificationCenter.default.post(
            name: .favoritesDidChange,
            object: nil
        )
    }

    func update(game: GameEntity) throws {

        if context.hasChanges {
            try context.save()
        }

        NotificationCenter.default.post(
            name: .favoritesDidChange,
            object: nil
        )
    }

    func delete(game: GameEntity) throws {

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
