import Domain

import Foundation

public final class ProfileRepository: ProfileRepositoryProtocol {

    private enum Keys {

        static let name = "profile_name"
        static let role = "profile_role"
        static let email = "profile_email"
        static let location = "profile_location"
    }

    private let defaults: UserDefaults

    public init(
        defaults: UserDefaults = .standard
    ) {
        self.defaults = defaults
    }

    public func loadProfile() -> Profile {

        Profile(
            name: defaults.string(forKey: Keys.name) ?? "Jonry Simbolon",
            role: defaults.string(forKey: Keys.role) ?? "iOS Developer",
            email: defaults.string(forKey: Keys.email) ?? "jonrysimbolon19@gmail.com",
            location: defaults.string(forKey: Keys.location) ?? "Indonesia"
        )
    }

    public func saveProfile(_ profile: Profile) {

        defaults.set(profile.name, forKey: Keys.name)
        defaults.set(profile.role, forKey: Keys.role)
        defaults.set(profile.email, forKey: Keys.email)
        defaults.set(profile.location, forKey: Keys.location)
    }
}
