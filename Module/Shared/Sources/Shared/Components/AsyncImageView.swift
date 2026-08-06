import SwiftUI

public struct AsyncImageView: View {
    public let urlString: String?
    public var cornerRadius: CGFloat = 12

    public init(
        urlString: String?,
        cornerRadius: CGFloat = 12
    ) {
        self.urlString = urlString
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
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
