import SwiftUI
import Shared
func aboutRow(icon: String, label: String, value: String) -> some View {
    HStack(spacing: 12) {
        Image(systemName: icon)
            .foregroundStyle(AppTheme.accentPurple)
            .frame(width: 24)

        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
}
