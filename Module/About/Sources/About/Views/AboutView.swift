import Domain
import Shared

import SwiftUI

public struct AboutView: View {

    @StateObject private var viewModel: AboutViewModel
    private let editProfileBuilder: () -> EditProfileView
    public init(
        viewModel: AboutViewModel,
        editProfileBuilder: @escaping () -> EditProfileView
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.editProfileBuilder = editProfileBuilder
    }
    public var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                VStack(spacing: 24) {
                    Image("jonryImg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                        .offset(y: 30)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(AppTheme.accentGradient, lineWidth: 3)
                        )
                        .shadow(color: AppTheme.accentPurple.opacity(0.4), radius: 12)

                    VStack(spacing: 8) {
                        Text(viewModel.profile.name)
                            .font(.title2.bold())
                            .foregroundStyle(.white)

                        Text(viewModel.profile.role)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        aboutRow(
                            icon: "envelope.fill",
                            label: "Email",
                            value: viewModel.profile.email
                        )

                        aboutRow(
                            icon: "mappin.circle.fill",
                            label: "Lokasi",
                            value: viewModel.profile.location
                        )
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AppTheme.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)

                    NavigationLink {
                        editProfileBuilder()
                    } label: {
                        Text("Edit Profile")
                    }

                    Spacer()
                }
                .padding(.top, 40)
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(AppTheme.background, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .onAppear {
                viewModel.loadProfile()
            }
        }
    }
}
