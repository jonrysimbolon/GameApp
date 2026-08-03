import SwiftUI
import Swinject

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            AppContainer.shared.container.resolve(HomeView.self)!
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            FavoriteView(
                viewModel: AppContainer.shared.container.resolve(
                    FavoriteViewModel.self
                )!
            )
            .tabItem {
                Label("Favorite", systemImage: "heart.fill")
            }
            .tag(1)

            AboutView()
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
