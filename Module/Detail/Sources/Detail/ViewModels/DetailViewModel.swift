import Domain
import Shared

import Foundation
import Combine

@MainActor
public final class DetailViewModel: ObservableObject {

    @Published var game: Game?
    @Published var state: ViewState = .idle
    @Published var isFavorite = false

    private let gameId: Int
    private let getGameDetailUseCase: GetGameDetailUseCase
    private let isFavoriteUseCase: IsFavoriteUseCase
    private let toggleFavoriteUseCase: ToggleFavoriteUseCase

    private var cancellables = Set<AnyCancellable>()

    public init(
        gameId: Int,
        getGameDetailUseCase: GetGameDetailUseCase,
        isFavoriteUseCase: IsFavoriteUseCase,
        toggleFavoriteUseCase: ToggleFavoriteUseCase
    ) {
        self.gameId = gameId
        self.getGameDetailUseCase = getGameDetailUseCase
        self.isFavoriteUseCase = isFavoriteUseCase
        self.toggleFavoriteUseCase = toggleFavoriteUseCase
    }

    func loadDetail() {

        if game == nil {
            state = .loading
        }

        getGameDetailUseCase.execute(id: gameId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let self else { return }

                if case .failure(let error) = completion {

                    if self.game == nil {
                        self.state = .error(error.localizedDescription)
                    }
                }

            } receiveValue: { [weak self] game in

                guard let self else { return }

                self.game = game
                self.isFavorite = self.isFavoriteUseCase.execute(id: self.gameId)
                self.state = .loaded
            }
            .store(in: &cancellables)
    }

    func toggleFavorite() {

        guard let game else { return }

        isFavorite = toggleFavoriteUseCase.execute(game: game)
    }
}
