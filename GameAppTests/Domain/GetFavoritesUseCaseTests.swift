import XCTest
import Combine
@testable import GameApp

final class GetFavoritesUseCaseTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()

    func testGetFavoritesSuccess() {

        let repository = FavoriteRepositoryMock()

        repository.favorites = [
            Game(
                id: 1,
                name: "Favorite Game",
                released: nil,
                rating: 5,
                backgroundImage: nil,
                descriptionRaw: nil
            )
        ]

        let useCase = GetFavoritesUseCaseImpl(
            repository: repository
        )

        let expectation = expectation(
            description: "Load Favorites"
        )

        useCase.execute()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { games in

                    XCTAssertEqual(
                        games.count,
                        1
                    )

                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }
}
