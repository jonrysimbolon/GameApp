protocol SaveProfileUseCase {

    func execute(_ profile: Profile)
}

final class SaveProfileUseCaseImpl: SaveProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    init(
        repository: ProfileRepositoryProtocol
    ) {
        self.repository = repository
    }

    func execute(_ profile: Profile) {

        repository.saveProfile(profile)
    }
}
