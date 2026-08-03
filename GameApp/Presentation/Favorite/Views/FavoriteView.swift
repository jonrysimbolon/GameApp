import SwiftUI
import Swinject

struct FavoriteView: View {

    @StateObject var viewModel: FavoriteViewModel

    var body: some View {

        NavigationStack {

            ZStack {

                AppTheme.background
                    .ignoresSafeArea()

                switch viewModel.state {

                case .idle:
                    EmptyView()

                case .loading:
                    LoadingView()

                case .loaded:

                    ScrollView {

                        LazyVStack(spacing: 12) {

                            ForEach(viewModel.favorites) { game in

                                NavigationLink(value: game.id) {

                                    GameRowView(game: game)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    }

                case .empty:
                    emptyState

                case .error(let message):

                    ErrorView(message: message) {
                        viewModel.loadFavorites()
                    }

                case .searching:
                    EmptyView()
                }
            }
            .navigationTitle("Favorite")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(
                AppTheme.background,
                for: .navigationBar
            )
            .toolbarColorScheme(
                .dark,
                for: .navigationBar
            )

            .navigationDestination(for: Int.self) { gameId in

                AppContainer.shared.container.resolve(
                    DetailView.self,
                    argument: gameId
                )!
            }

            .onAppear {
                viewModel.loadFavorites()
            }

            .onReceive(
                NotificationCenter.default.publisher(
                    for: .favoritesDidChange
                )
            ) { _ in
                viewModel.loadFavorites()
            }
        }
    }

    private var emptyState: some View {

        VStack(spacing: 16) {

            Image(systemName: "heart.slash")
                .font(.system(size: 48))
                .foregroundStyle(
                    AppTheme.accentPurple.opacity(0.6)
                )

            Text("Belum Ada Favorit")
                .font(.headline)
                .foregroundStyle(.white)

            Text("Tekan ikon hati di halaman detail untuk menyimpan game favorit.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }
}
