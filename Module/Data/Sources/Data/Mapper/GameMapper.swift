import Domain

public extension GameDTO {

    func toDomain() -> Game {
        Game(
            id: id,
            name: name,
            released: released,
            rating: rating,
            backgroundImage: backgroundImage,
            descriptionRaw: descriptionRaw
        )
    }
}
