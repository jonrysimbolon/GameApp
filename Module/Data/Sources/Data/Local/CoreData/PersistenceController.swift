import CoreData

public struct PersistenceController: Sendable {

    public static let shared = PersistenceController()

    public let container: NSPersistentContainer

    public init(inMemory: Bool = false) {
        let bundle = Bundle.module

        guard let modelURL = bundle.url(
            forResource: "GameApp",
            withExtension: "momd"
        ),
        let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Core Data model not found")
        }

        container = NSPersistentContainer(
            name: "GameApp",
            managedObjectModel: model
        )

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    public var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    public func save() {
        let context = container.viewContext

        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            print("Core Data save error: \(error.localizedDescription)")
        }
    }
}
