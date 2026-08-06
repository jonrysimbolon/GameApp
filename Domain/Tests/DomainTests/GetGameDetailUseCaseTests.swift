import XCTest
import Domain
import Combine

final class GetGameDetailUseCaseTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()

    @MainActor func testGetGameDetailSuccess() {

        let repository = GameRepositoryMock()

        repository.gameDetail = Game(
            id: 10,
            name: "God Of War",
            released: nil,
            rating: 4.8,
            backgroundImage: nil,
            descriptionRaw: nil
        )

        let useCase = GetGameDetailUseCaseImpl(
            repository: repository
        )

        let expectation = expectation(
            description: "Load Detail"
        )

        useCase.execute(id: 10)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { game in

                    XCTAssertEqual(
                        game.id,
                        10
                    )

                    XCTAssertEqual(
                        game.name,
                        "God Of War"
                    )

                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }
}
