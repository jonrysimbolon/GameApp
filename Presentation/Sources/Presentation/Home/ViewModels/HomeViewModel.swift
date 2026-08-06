import Domain
import Shared

import Foundation
import Combine

@MainActor
public final class HomeViewModel: ObservableObject {

    @Published var games: [Game] = []
    @Published var state: ViewState = .idle
    @Published var searchText = ""

    private let getGamesUseCase: GetGamesUseCase
    private let searchGamesUseCase: SearchGamesUseCase

    private var cancellables = Set<AnyCancellable>()

    public init(
        getGamesUseCase: GetGamesUseCase,
        searchGamesUseCase: SearchGamesUseCase
    ) {
        self.getGamesUseCase = getGamesUseCase
        self.searchGamesUseCase = searchGamesUseCase

        bindSearch()
    }

    func loadGames() {

        state = .loading

        getGamesUseCase.execute(page: 1)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let self else { return }

                if case let .failure(error) = completion {
                    self.games = []
                    self.state = .error(error.localizedDescription)
                }

            } receiveValue: { [weak self] games in

                guard let self else { return }

                self.games = games
                self.state = games.isEmpty ? .empty : .loaded
            }
            .store(in: &cancellables)
    }
}

private extension HomeViewModel {

    func bindSearch() {

        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] keyword in

                guard let self else { return }

                if keyword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {

                    self.loadGames()

                } else {

                    self.search(keyword)
                }
            }
            .store(in: &cancellables)
    }

    func search(_ keyword: String) {

        state = .searching

        searchGamesUseCase.execute(query: keyword)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let self else { return }

                if case let .failure(error) = completion {
                    self.games = []
                    self.state = .error(error.localizedDescription)
                }

            } receiveValue: { [weak self] games in

                guard let self else { return }

                self.games = games
                self.state = games.isEmpty ? .empty : .loaded
            }
            .store(in: &cancellables)
    }
}
