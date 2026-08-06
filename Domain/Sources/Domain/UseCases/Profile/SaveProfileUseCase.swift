public protocol SaveProfileUseCase {

    func execute(_ profile: Profile)
}

public final class SaveProfileUseCaseImpl: SaveProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    public init(
        repository: ProfileRepositoryProtocol
    ) {
        self.repository = repository
    }

    public func execute(_ profile: Profile) {
        repository.saveProfile(profile)
    }
}
