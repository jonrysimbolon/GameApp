import Domain
import Presentation
import Swinject

final class ViewModelAssembly: Assembly {

    func assemble(container: Container) {
        registerHome(container)
        registerFavorite(container)
        registerDetail(container)
        registerAbout(container)
    }
}

private extension ViewModelAssembly {

    func registerHome(_ container: Container) {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                getGamesUseCase: resolver.resolve(GetGamesUseCase.self)!,
                searchGamesUseCase: resolver.resolve(SearchGamesUseCase.self)!
            )
        }

        container.register(HomeView.self) { resolver in
            HomeView(
                viewModel: resolver.resolve(HomeViewModel.self)!,
                detailViewBuilder: { id in
                    resolver.resolve(
                        DetailView.self,
                        argument: id
                    )!
                }
            )
        }
    }

    func registerFavorite(_ container: Container) {
        container.register(FavoriteViewModel.self) { resolver in
            FavoriteViewModel(
                getFavoritesUseCase: resolver.resolve(GetFavoritesUseCase.self)!
            )
        }

        container.register(FavoriteView.self) { resolver in
            FavoriteView(
                viewModel: resolver.resolve(FavoriteViewModel.self)!,
                detailViewBuilder: { id in
                    resolver.resolve(
                        DetailView.self,
                        argument: id
                    )!
                }
            )
        }
    }

    func registerDetail(_ container: Container) {
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
    }

    func registerAbout(_ container: Container) {
        container.register(AboutViewModel.self) { resolver in
            AboutViewModel(
                getProfileUseCase: resolver.resolve(GetProfileUseCase.self)!
            )
        }

        container.register(AboutView.self) { resolver in
            AboutView(
                viewModel: resolver.resolve(AboutViewModel.self)!,
                editProfileBuilder: {
                    resolver.resolve(EditProfileView.self)!
                }
            )
        }

        container.register(EditProfileViewModel.self) { resolver in
            EditProfileViewModel(
                getProfileUseCase: resolver.resolve(GetProfileUseCase.self)!,
                saveProfileUseCase: resolver.resolve(SaveProfileUseCase.self)!
            )
        }

        container.register(EditProfileView.self) { resolver in
            EditProfileView(
                viewModel: resolver.resolve(EditProfileViewModel.self)!
            )
        }
    }
}
