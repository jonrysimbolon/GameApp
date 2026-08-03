internal import Foundation
import Combine

@MainActor
final class EditProfileViewModel: ObservableObject {

    @Published var profile: Profile
    @Published var state: ViewState = .idle

    private let getProfileUseCase: GetProfileUseCase
    private let saveProfileUseCase: SaveProfileUseCase

    init(
        getProfileUseCase: GetProfileUseCase,
        saveProfileUseCase: SaveProfileUseCase
    ) {

        self.getProfileUseCase = getProfileUseCase
        self.saveProfileUseCase = saveProfileUseCase

        self.profile = getProfileUseCase.execute()
        self.state = .loaded
    }

    var canSave: Bool {

        [
            profile.name,
            profile.role,
            profile.email,
            profile.location
        ]
            .allSatisfy { !$0.isBlank }
    }

    func saveProfile() {

        guard canSave else { return }

        saveProfileUseCase.execute(profile)

        state = .loaded
    }
}

extension String {

    var isBlank: Bool {

        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
