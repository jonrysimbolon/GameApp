internal import Foundation

enum APIConfig {
    static let baseURL: String = {
        guard let host = Bundle.main.infoDictionary?["API_HOST"] as? String else {
            fatalError("API_HOST tidak ditemukan di Info.plist")
        }
        return "https://" + host
    }()

    static let apiKey: String = {
        guard let value = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            fatalError("API_KEY tidak ditemukan di Info.plist")
        }
        return value
    }()
}
