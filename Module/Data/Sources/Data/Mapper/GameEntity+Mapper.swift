import Domain

public extension GameEntity {

    func update(from game: Game) {

        id = Int32(game.id)
        name = game.name
        released = game.released
        rating = game.rating
        backgroundImage = game.backgroundImage
        gameDescription = game.descriptionRaw
    }

    func toDomain() -> Game {

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
