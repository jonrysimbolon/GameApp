import SwiftUI

public enum AppTheme {
    public static let background = Color(red: 0.05, green: 0.05, blue: 0.12)
    public static let cardBackground = Color(red: 0.11, green: 0.11, blue: 0.18)
    public static let accentPurple = Color(red: 0.49, green: 0.23, blue: 0.93)
    public static let accentPink = Color(red: 0.66, green: 0.33, blue: 0.97)

    public static var accentGradient: LinearGradient {
        LinearGradient(
            colors: [accentPurple, accentPink],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
