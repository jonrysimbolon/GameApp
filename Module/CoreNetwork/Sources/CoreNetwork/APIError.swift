import Foundation

public enum APIError: LocalizedError {

    case invalidResponse
    case decoding(Error)
    case network(Error)

    public var errorDescription: String? {
        switch self {

        case .invalidResponse:
            return "Data tidak dapat dimuat. Silakan coba lagi."

        case .decoding:
            return "Terjadi kesalahan saat memproses data. Silakan coba lagi."

        case .network(let error):

            if let urlError = error as? URLError {
                switch urlError.code {

                case .notConnectedToInternet:
                    return "Tidak ada koneksi internet. Periksa jaringan Anda dan coba lagi."

                case .timedOut:
                    return "Koneksi terlalu lama. Silakan coba lagi."

                default:
                    return "Gagal terhubung ke server. Silakan coba lagi."
                }
            }

            return "Gagal terhubung ke server. Silakan coba lagi."
        }
    }
}
