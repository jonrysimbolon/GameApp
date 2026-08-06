import SwiftUI

struct FavoriteToolbarButton: View {

    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        Button {
            viewModel.toggleFavorite()
        } label: {
            Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(viewModel.isFavorite ? .red : .white)
        }
    }
}
