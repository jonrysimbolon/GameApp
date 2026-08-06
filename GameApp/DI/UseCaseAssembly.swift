import Domain

import Swinject

final class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetGamesUseCase.self) { resolver in

            GetGamesUseCaseImpl(
                repository: resolver.resolve((any GameRepositoryProtocol).self)!
            )
        }

        container.register(SearchGamesUseCase.self) { resolver in

            SearchGamesUseCaseImpl(
                repository: resolver.resolve((any GameRepositoryProtocol).self)!
            )
        }

        container.register(GetGameDetailUseCase.self) { resolver in

            GetGameDetailUseCaseImpl(
                repository: resolver.resolve((any GameRepositoryProtocol).self)!
            )
        }

        container.register(GetFavoritesUseCase.self) { resolver in

            GetFavoritesUseCaseImpl(
                repository: resolver.resolve((any FavoriteRepositoryProtocol).self)!
            )
        }

        container.register(IsFavoriteUseCase.self) { resolver in

            IsFavoriteUseCaseImpl(
                repository: resolver.resolve((any FavoriteRepositoryProtocol).self)!
            )
        }

        container.register(ToggleFavoriteUseCase.self) { resolver in

            ToggleFavoriteUseCaseImpl(
                repository: resolver.resolve((any FavoriteRepositoryProtocol).self)!
            )
        }

        container.register(GetProfileUseCase.self) { resolver in

            GetProfileUseCaseImpl(
                repository: resolver.resolve(ProfileRepositoryProtocol.self)!
            )
        }

        container.register(SaveProfileUseCase.self) { resolver in

            SaveProfileUseCaseImpl(
                repository: resolver.resolve(ProfileRepositoryProtocol.self)!
            )
        }
    }
}
