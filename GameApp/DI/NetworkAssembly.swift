import Swinject
import Foundation
import CoreNetwork

final class NetworkAssembly: Assembly {

    func assemble(container: Container) {

        container.register(APIConfig.self) { _ in

            guard let host = Bundle.main.infoDictionary?["API_HOST"] as? String else {
                fatalError("API_HOST tidak ditemukan di Info.plist")
            }

            guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else {
                fatalError("API_KEY tidak ditemukan di Info.plist")
            }

            return APIConfig(
                baseURL: "https://" + host,
                apiKey: key
            )
        }

        container.register(NetworkProvider.self) { resolver in
            AlamofireNetworkProvider(
                config: resolver.resolve(APIConfig.self)!
            )
        }
    }
}
