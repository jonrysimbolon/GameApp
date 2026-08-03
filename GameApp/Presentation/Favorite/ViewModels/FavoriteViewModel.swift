internal import Foundation
import Combine

@MainActor
final class FavoriteViewModel: ObservableObject {

    @Published var favorites: [Game] = []
    @Published var state: ViewState = .idle

    private let getFavoritesUseCase: GetFavoritesUseCase

    private var cancellables = Set<AnyCancellable>()

    init(
        getFavoritesUseCase: GetFavoritesUseCase
    ) {
        self.getFavoritesUseCase = getFavoritesUseCase
    }

    func loadFavorites() {

        state = .loading

        getFavoritesUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let self else { return }

                switch completion {

                case .finished:
                    break

                case .failure(let error):
                    self.state = .error(error.localizedDescription)
                }

            } receiveValue: { [weak self] games in

                guard let self else { return }

                self.favorites = games
                self.state = games.isEmpty ? .empty : .loaded
            }
            .store(in: &cancellables)
    }
}
