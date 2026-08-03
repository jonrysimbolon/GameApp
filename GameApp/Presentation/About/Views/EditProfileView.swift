import SwiftUI

struct EditProfileView: View {

    @Environment(\.dismiss) private var dismiss

    @ObservedObject var viewModel: EditProfileViewModel

    var body: some View {

        ZStack {

            AppTheme.background
                .ignoresSafeArea()

            Form {

                Section {

                    TextField(
                        "Name",
                        text: $viewModel.profile.name
                    )

                    TextField(
                        "Role",
                        text: $viewModel.profile.role
                    )

                    TextField(
                        "Email",
                        text: $viewModel.profile.email
                    )
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)

                    TextField(
                        "Location",
                        text: $viewModel.profile.location
                    )
                }
                .listRowBackground(
                    AppTheme.cardBackground
                )
            }
            .scrollContentBackground(.hidden)
            .background(AppTheme.background)
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            AppTheme.background,
            for: .navigationBar
        )
        .toolbarColorScheme(
            .dark,
            for: .navigationBar
        )
        .toolbar {

            ToolbarItem(
                placement: .topBarTrailing
            ) {

                Button("Save") {

                    viewModel.saveProfile()

                    dismiss()
                }
                .disabled(
                    !viewModel.canSave
                )
                .tint(
                    AppTheme.accentPurple
                )
            }
        }
        .toolbar(
            .hidden,
            for: .tabBar
        )
    }
}
