// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jonrysimbolon/GameAppIosDomain.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "Domain", package: "GameAppIosDomain")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
