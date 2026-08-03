import Swinject

final class AppContainer {

    static let shared = AppContainer()

    private let assembler = Assembler([
        NetworkAssembly(),
        RepositoryAssembly(),
        UseCaseAssembly(),
        ViewModelAssembly()
    ])

    var container: Resolver {
        assembler.resolver
    }
}
