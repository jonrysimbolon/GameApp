import Foundation

public struct Game: Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let released: String?
    public let rating: Double
    public let backgroundImage: String?
    public let descriptionRaw: String?

    public var formattedReleaseDate: String {
        released ?? "Unknown"
    }

    public var formattedRating: String {
        String(format: "%.1f", rating)
    }

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
}
