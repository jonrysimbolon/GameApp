import Swinject

final class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { resolver in

            HomeViewModel(
                getGamesUseCase: resolver.resolve(GetGamesUseCase.self)!,
                searchGamesUseCase: resolver.resolve(SearchGamesUseCase.self)!
            )
        }

        container.register(HomeView.self) { resolver in

            HomeView(
                viewModel: resolver.resolve(HomeViewModel.self)!
            )
        }

        container.register(FavoriteViewModel.self) { resolver in

            FavoriteViewModel(
                getFavoritesUseCase: resolver.resolve(GetFavoritesUseCase.self)!
            )
        }

        container.register(FavoriteView.self) { resolver in

            FavoriteView(
                viewModel: resolver.resolve(FavoriteViewModel.self)!
            )
        }

        container.register(DetailViewModel.self) { (resolver, gameId: Int) in

            DetailViewModel(
                gameId: gameId,
                getGameDetailUseCase: resolver.resolve(GetGameDetailUseCase.self)!,
                isFavoriteUseCase: resolver.resolve(IsFavoriteUseCase.self)!,
                toggleFavoriteUseCase: resolver.resolve(ToggleFavoriteUseCase.self)!
            )
        }

        container.register(DetailView.self) { (resolver, gameId: Int) in

            DetailView(
                viewModel: resolver.resolve(
                    DetailViewModel.self,
                    argument: gameId
                )!
            )
        }

        container.register(AboutViewModel.self) { resolver in

            AboutViewModel(
                getProfileUseCase: resolver.resolve(GetProfileUseCase.self)!
            )
        }

        container.register(EditProfileViewModel.self) { resolver in

            EditProfileViewModel(
                getProfileUseCase: resolver.resolve(GetProfileUseCase.self)!,
                saveProfileUseCase: resolver.resolve(SaveProfileUseCase.self)!
            )
        }
    }
}
