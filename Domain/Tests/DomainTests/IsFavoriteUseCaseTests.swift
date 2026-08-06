import XCTest
import Domain

final class IsFavoriteUseCaseTests: XCTestCase {

    func testIsFavoriteReturnsTrue() {

        let repository = FavoriteRepositoryMock()

        repository.favoriteIds.insert(1)

        let useCase = IsFavoriteUseCaseImpl(
            repository: repository
        )

        XCTAssertTrue(
            useCase.execute(id: 1)
        )
    }
}
