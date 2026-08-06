import SwiftUI
import Data

@main
struct GameAppApp: App {

    let persistenceController = PersistenceController.shared

    var body: some Scene {

        WindowGroup {

            MainTabView()
                .environment(
                    \.managedObjectContext,
                    persistenceController.viewContext
                )
                .preferredColorScheme(.dark)
        }
    }
}
