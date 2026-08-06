import SwiftUI

public struct LoadingView: View {
    public var message: String

    public init(
        message: String? = nil
    ) {
        self.message = message ?? String(localized: "loading_message", bundle: .module)
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
