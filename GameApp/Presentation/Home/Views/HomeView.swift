import SwiftUI
import Swinject

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    searchBar
                    content
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(AppTheme.background, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .onAppear {
                if viewModel.games.isEmpty {
                    viewModel.loadGames()
                }
            }
        }
    }

    private var searchBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField("Search...", text: $viewModel.searchText)
                .foregroundStyle(.white)
                .autocorrectionDisabled()

            if !viewModel.searchText.isEmpty {
                Button {
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(12)
        .background(AppTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .idle:
            EmptyView()

        case .loading:
            LoadingView()

        case .empty:
            ContentUnavailableView(
                "Tidak ada game",
                systemImage: "gamecontroller"
            )

        case .error(let message):
            ErrorView(message: message) {
                viewModel.loadGames()
            }

        case .loaded, .searching:
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.games) { game in
                        NavigationLink(value: game.id) {
                            GameRowView(game: game)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .overlay {
                if viewModel.state == .searching {
                    LoadingView(message: "Mencari...")
                        .background(AppTheme.background.opacity(0.6))
                }
            }
            .navigationDestination(for: Int.self) { gameId in
                AppContainer.shared.container.resolve(
                    DetailView.self,
                    argument: gameId
                )!
            }
        }
    }
}
