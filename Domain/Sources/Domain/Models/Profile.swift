public struct Profile: Hashable {
    public var name: String
    public var role: String
    public var email: String
    public var location: String

    public init(
        name: String,
        role: String,
        email: String,
        location: String
    ) {
        self.name = name
        self.role = role
        self.email = email
        self.location = location
    }
}
