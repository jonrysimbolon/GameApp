import SwiftUI

enum AppTheme {
    static let background = Color(red: 0.05, green: 0.05, blue: 0.12)
    static let cardBackground = Color(red: 0.11, green: 0.11, blue: 0.18)
    static let accentPurple = Color(red: 0.49, green: 0.23, blue: 0.93)
    static let accentPink = Color(red: 0.66, green: 0.33, blue: 0.97)

    static var accentGradient: LinearGradient {
        LinearGradient(
            colors: [accentPurple, accentPink],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
