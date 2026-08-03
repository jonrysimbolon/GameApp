import Swinject

final class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkProvider.self) { _ in
            AlamofireNetworkProvider()
        }
    }
}
