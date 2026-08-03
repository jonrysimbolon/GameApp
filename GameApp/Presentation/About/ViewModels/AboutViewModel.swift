internal import Foundation
import Combine

@MainActor
final class AboutViewModel: ObservableObject {

    @Published var profile: Profile
    @Published var state: ViewState = .idle

    private let getProfileUseCase: GetProfileUseCase

    init(
        getProfileUseCase: GetProfileUseCase
    ) {

        self.getProfileUseCase = getProfileUseCase

        self.profile = Profile(
            name: "",
            role: "",
            email: "",
            location: ""
        )

        loadProfile()
    }

    func loadProfile() {

        state = .loading

        profile = getProfileUseCase.execute()

        state = .loaded
    }
}
