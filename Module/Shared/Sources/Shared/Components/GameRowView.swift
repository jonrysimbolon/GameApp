import Domain
import Shared

import SwiftUI

public struct GameRowView: View {
    let game: Game

    public init(game: Game) {
        self.game = game
    }

    public var body: some View {
        HStack(spacing: 12) {
            AsyncImageView(urlString: game.backgroundImage)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 6) {
                Text(game.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .lineLimit(2)
                Text(game.formattedReleaseDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.yellow)
                    Text(game.formattedRating)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(12)
        .background(AppTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
