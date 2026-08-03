import SwiftUI

struct DetailView: View {

    @StateObject var viewModel: DetailViewModel

    var body: some View {

        ZStack {

            AppTheme.background
                .ignoresSafeArea()

            Group {

                switch viewModel.state {

                case .idle:
                    EmptyView()

                case .loading:
                    LoadingView()

                case .loaded:

                    if let game = viewModel.game {
                        detailContent(for: game)
                    }

                case .error(let message):

                    ErrorView(message: message) {
                        viewModel.loadDetail()
                    }

                case .searching,
                     .empty:

                    EmptyView()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(AppTheme.background, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {

            ToolbarItem(placement: .topBarTrailing) {

                FavoriteToolbarButton(
                    viewModel: viewModel
                )
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .onAppear {

            if viewModel.game == nil {
                viewModel.loadDetail()
            }
        }
    }

    private func detailContent(
        for game: Game
    ) -> some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 16
            ) {

                DetailHeaderView(
                    game: game
                )

                DetailDescriptionView(
                    description: game.descriptionRaw
                )
            }
            .padding(16)
        }
    }
}
