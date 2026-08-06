public nonisolated struct GameListResponseDTO: Decodable, Sendable {

    public let results: [GameDTO]

    public init(results: [GameDTO]) {
        self.results = results
    }
}
