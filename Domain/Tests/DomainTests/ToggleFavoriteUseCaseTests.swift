import XCTest
import Domain

final class ToggleFavoriteUseCaseTests: XCTestCase {

    func testToggleFavoriteSuccess() {

        let repository = FavoriteRepositoryMock()

        let useCase = ToggleFavoriteUseCaseImpl(
            repository: repository
        )

        let game = Game(
            id: 1,
            name: "Game",
            released: nil,
            rating: 4.5,
            backgroundImage: nil,
            descriptionRaw: nil
        )

        XCTAssertTrue(
            useCase.execute(game: game)
        )

        XCTAssertFalse(
            useCase.execute(game: game)
        )
    }
}
