import UIKit

public enum HTMLStripper {
    public static func stripHTML(from html: String) -> String {
        guard let data = html.data(using: .utf8) else {
            return html
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributed = try? NSAttributedString(
            data: data,
            options: options,
            documentAttributes: nil
        ) else {
            return html
        }

        return attributed.string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
