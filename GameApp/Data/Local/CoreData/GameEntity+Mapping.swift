import CoreData

extension GameEntity {
    func update(from game: Game, isFav: Bool) {
        id = Int32(game.id)
        name = game.name
        released = game.released
        rating = game.rating
        backgroundImage = game.backgroundImage
        gameDescription = game.descriptionRaw
        self.isFav = isFav
    }

    func toGame() -> Game {
        Game(
            id: Int(id),
            name: name ?? "Unknown",
            released: released,
            rating: rating,
            backgroundImage: backgroundImage,
            descriptionRaw: gameDescription
        )
    }
}
