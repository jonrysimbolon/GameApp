import SwiftUI

public struct LoadingView: View {
    public var message: String = "Memuat data..."

    public init(
        message: String = "Memuat data..."
    ) {
        self.message = message
    }

    public var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(
                        tint: AppTheme.accentPurple
                    )
                )
                .scaleEffect(1.2)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
