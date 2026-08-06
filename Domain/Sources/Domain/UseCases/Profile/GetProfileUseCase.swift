public protocol GetProfileUseCase {

    func execute() -> Profile
}

public final class GetProfileUseCaseImpl: GetProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    public init(
        repository: ProfileRepositoryProtocol
    ) {
        self.repository = repository
    }

    public func execute() -> Profile {
        repository.loadProfile()
    }
}
