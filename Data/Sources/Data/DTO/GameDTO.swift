public nonisolated struct GameDTO: Decodable, Sendable {

    public let id: Int
    public let name: String
    public let released: String?
    public let rating: Double
    public let backgroundImage: String?
    public let descriptionRaw: String?

    public init(
        id: Int,
        name: String,
        released: String?,
        rating: Double,
        backgroundImage: String?,
        descriptionRaw: String?
    ) {
        self.id = id
        self.name = name
        self.released = released
        self.rating = rating
        self.backgroundImage = backgroundImage
        self.descriptionRaw = descriptionRaw
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case rating
        case backgroundImage = "background_image"
        case descriptionRaw = "description_raw"
    }
}
