import Domain
import Shared

import SwiftUI

struct DetailHeaderView: View {

    let game: Game

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 16
        ) {

            AsyncImageView(
                urlString: game.backgroundImage,
                cornerRadius: 16
            )
            .frame(height: 220)
            .frame(maxWidth: .infinity)

            VStack(
                alignment: .leading,
                spacing: 8
            ) {

                Text(game.name)
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                HStack(spacing: 16) {

                    Label(
                        game.formattedReleaseDate,
                        systemImage: "calendar"
                    )

                    Label(
                        game.formattedRating,
                        systemImage: "star.fill"
                    )
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
        }
    }
}
