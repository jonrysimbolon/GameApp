import SwiftUI
import Shared

struct DetailDescriptionView: View {

    let description: String?

    var body: some View {

        Group {

            if let description,
               !description.isEmpty {

                Text(
                    HTMLStripper.stripHTML(
                        from: description
                    )
                )
                .font(.body)
                .foregroundStyle(
                    .white.opacity(0.85)
                )
                .lineSpacing(4)

            } else {

                Text("Deskripsi tidak tersedia.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
