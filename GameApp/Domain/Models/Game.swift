internal import Foundation
struct Game: Identifiable, Hashable {
    let id: Int
    let name: String
    let released: String?
    let rating: Double
    let backgroundImage: String?
    let descriptionRaw: String?

    var formattedReleaseDate: String {
        released ?? "Unknown"
    }

    var formattedRating: String {
        String(format: "%.1f", rating)
    }
}
