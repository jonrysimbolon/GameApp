struct GameDTO: Decodable {
    let id: Int
    let name: String
    let released: String?
    let rating: Double
    let backgroundImage: String?
    let descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case rating
        case backgroundImage = "background_image"
        case descriptionRaw = "description_raw"
    }
}
