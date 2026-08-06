import XCTest
import Domain
import Combine

final class GetGamesUseCaseTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()

    @MainActor func testGetGamesSuccess() {

        let repository = GameRepositoryMock()

        repository.games = [
            Game(
                id: 1,
                name: "Game A",
                released: nil,
                rating: 4.5,
                backgroundImage: nil,
                descriptionRaw: nil
            )
        ]

        let useCase = GetGamesUseCaseImpl(
            repository: repository
        )

        let expectation = expectation(
            description: "Load Games"
        )

        useCase.execute(page: 1)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { games in

                    XCTAssertEqual(
                        games.count,
                        1
                    )

                    XCTAssertEqual(
                        games.first?.name,
                        "Game A"
                    )

                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }
}
