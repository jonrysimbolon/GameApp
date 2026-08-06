import SwiftUI
import About
import Favorite
import Detail
import Home
import Shared
import Swinject

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(
                viewModel: AppContainer.shared.container.resolve(HomeViewModel.self)!,
                detailViewBuilder: { id in
                    AppContainer.shared.container.resolve(
                        DetailView.self,
                        argument: id
                    )!
                }
            )
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            FavoriteView(
                viewModel: AppContainer.shared.container.resolve(FavoriteViewModel.self)!,
                detailViewBuilder: { id in
                    AppContainer.shared.container.resolve(
                        DetailView.self,
                        argument: id
                    )!
                }
            )
            .tabItem {
                Label("Favorite", systemImage: "heart.fill")
            }
            .tag(1)

            AboutView(
                viewModel: AppContainer.shared.container.resolve(AboutViewModel.self)!,
                editProfileBuilder: {
                    EditProfileView(
                        viewModel: AppContainer.shared.container.resolve(EditProfileViewModel.self)!
                    )
                }
            )
            .tabItem {
                Label("About", systemImage: "person.fill")
            }
            .tag(2)
        }
        .tint(AppTheme.accentPurple)
        .onAppear {
            configureTabBarAppearance()
        }
    }

    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(AppTheme.cardBackground)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
