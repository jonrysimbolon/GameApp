// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jonrysimbolon/GameAppIosDomain.git", from: "1.1.0"),
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                .product(name: "Domain", package: "GameAppIosDomain"),
                "Shared"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
