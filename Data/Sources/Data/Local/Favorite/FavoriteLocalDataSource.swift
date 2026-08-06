public protocol FavoriteLocalDataSource {

    func fetchFavorites() throws -> [GameEntity]

    func fetchFavorite(id: Int) throws -> GameEntity?

    func save(game: GameEntity) throws

    func update(game: GameEntity) throws

    func delete(game: GameEntity) throws
}
