import SwiftUI

struct AsyncImageView: View {
    let urlString: String?
    var cornerRadius: CGFloat = 12

    var body: some View {
        Group {
            if let urlString, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        placeholder
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        placeholder
                    @unknown default:
                        placeholder
                    }
                }
            } else {
                placeholder
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    private var placeholder: some View {
        ZStack {
            AppTheme.cardBackground
            Image(systemName: "gamecontroller.fill")
                .font(.title2)
                .foregroundStyle(AppTheme.accentPurple.opacity(0.6))
        }
    }
}
