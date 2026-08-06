import Domain
import Data
import CoreNetwork

import Swinject

final class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GameRemoteDataSource.self) { resolver in
            GameRemoteDataSourceImpl(network: resolver.resolve(NetworkProvider.self)!)
        }

        container.register(GameRepositoryProtocol.self) { resolver in
            GameRepository(remote: resolver.resolve(GameRemoteDataSource.self)!)
        }

        container.register(FavoriteLocalDataSource.self) { _ in
            FavoriteLocalDataSourceImpl(context: PersistenceController.shared.viewContext)
        }

        container.register(FavoriteRepositoryProtocol.self) { resolver in
            FavoriteRepository(
                local: resolver.resolve(FavoriteLocalDataSource.self)!,
                context: PersistenceController.shared.viewContext
            )
        }

        container.register(ProfileRepositoryProtocol.self) { _ in
            ProfileRepository()
        }
    }
}
