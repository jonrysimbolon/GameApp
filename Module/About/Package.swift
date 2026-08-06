// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "About",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "About",
            targets: ["About"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jonrysimbolon/GameAppIosDomain.git", from: "1.1.0"),
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "About",
            dependencies: [
                .product(name: "Domain", package: "GameAppIosDomain"),
                "Shared"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
