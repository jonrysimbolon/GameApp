protocol GetProfileUseCase {

    func execute() -> Profile
}

final class GetProfileUseCaseImpl: GetProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    init(
        repository: ProfileRepositoryProtocol
    ) {
        self.repository = repository
    }

    func execute() -> Profile {

        repository.loadProfile()
    }
}
